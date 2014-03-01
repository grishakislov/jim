package ru.codekittens.jim.scanner {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.globalization.NationalDigitsType;
import flash.net.FileReference;
import flash.utils.ByteArray;

import ru.codekittens.jim.converter.JimConverter;
import ru.codekittens.jim.model.JimFile;
import ru.codekittens.jim.model.JimLayer;
import ru.codekittens.jim.model.LayerDefinition;

public class Scanner {

    private var tileSize:uint;

    //state
    private var source:Bitmap;
    private var sourceWidth:uint;
    private var sourceHeight:uint;
    private var currentColumn:uint = 0;
    private var numTiles:uint = 0;
    private var currentTile:BitmapData;
    private var currentRect:Rectangle;
    private var currentPoint:Point;
    private var currentId:uint = 0;

    //data
    private var model:JimLayer;
    private var definition:LayerDefinition;
    private var hashedTiles:Object;

    public function Scanner(tileSize:uint) {
        this.tileSize = tileSize;
    }

    public function scan(source:Bitmap, definition:LayerDefinition):void {
        this.source = source;
        sourceWidth = source.bitmapData.width / tileSize;
        sourceHeight = source.bitmapData.height / tileSize;
        hashedTiles = {};
        currentPoint = new Point();
        currentRect = new Rectangle(0, 0, tileSize, tileSize);
        initLayer();
        startScan();
    }

    private function initLayer():void {
        model = new JimFile();
        model.width = sourceWidth;
        model.height = sourceHeight;
        model.tileSize = tileSize;
        model.map = new ByteArray();

        var totalTiles:uint = sourceWidth * sourceHeight;
        for (var i:int = 0; i < totalTiles; i++) {
            model.map.writeByte(0);
        }
        model.map.position = 0;
    }

    private function startScan():void {
        for (var i:int = 0; i < sourceWidth; i++) {
            processNextColumn();
        }
        saveResults();
    }

    private function processNextColumn():void {
        trace("Processing " + (currentColumn + 1) + " of " + sourceWidth + " columns");

        var currentHash:String;
        var savedTile:SavedTile;
        for (var i:int = 0; i < sourceHeight; i++) {
            copyNextTile(i);
            currentHash = hash(currentTile);

            if (tileNotSaved(currentHash)) {
                trace("Hash: " + currentHash);
                savedTile = new SavedTile();
                savedTile.bitmapData = currentTile;
                savedTile.hash = currentHash;
                savedTile.id = getId();
                savedTile.useCount++;
                saveTile(savedTile);
            }

            mapTile(currentColumn, i, hashedTiles[currentHash]);
        }

        currentColumn++;
    }

    private function mapTile(x:uint, y:uint, tile:SavedTile):void {
        var index:uint = y * sourceWidth + x;
        model.map.position = index;
        model.map.writeByte(tile.id);
    }

    private function saveTile(savedTile:SavedTile):void {
        numTiles++;
        hashedTiles[savedTile.hash] = savedTile;
    }

    private function getId():uint {
        return currentId++;
    }

    private function tileNotSaved(hash:String):Boolean {
        return hashedTiles[hash] == null;
    }

    private function copyNextTile(rowNumber:uint):void {
        currentTile = new BitmapData(tileSize, tileSize, true, 0);
        currentRect.x = currentColumn * tileSize;
        currentRect.y = rowNumber * tileSize;
        currentTile.copyPixels(source.bitmapData, currentRect, currentPoint);
    }

    private function hash(data:BitmapData):String {
        var result:String = "";
        const MAX_HASH_LENGTH:uint = 64;
        const NUM_ITERATIONS:uint = 64;
        var byteArray:ByteArray = data.getPixels(data.rect);
        var currentValue:uint = 0;
        var currentPosition:uint;
        byteArray.position = 0;
        for (var i:int = 0; i < NUM_ITERATIONS; i++) {
            currentValue = 0;
            currentPosition = (byteArray.length - 3) / NUM_ITERATIONS * i;
            if (currentPosition > 3) {
                byteArray.position = currentPosition - 3;
                currentValue += byteArray.readByte() + i;
                currentValue += byteArray.readByte() + i;
                currentValue += byteArray.readByte() + i;
            } else {
                currentValue += byteArray.readByte() + i;
            }
            result += currentValue.toString();

        }

        if (result.length > MAX_HASH_LENGTH) {
            var newString:String = "";

            for (i = 0; i < MAX_HASH_LENGTH; i++) {
                newString += result.charAt(result.length / MAX_HASH_LENGTH * i);
            }
            return newString;
        }

        return result;
    }

    private function createBitmapDataFromHashedTiles():BitmapData {
        var result:BitmapData = new BitmapData(256, 256, true, 0);
        var tilesPerLine:uint = 256 / model.tileSize;

        for each (var tile:SavedTile in hashedTiles) {
            result.copyPixels(tile.bitmapData, new Rectangle(0, 0, tilesPerLine, tilesPerLine), getPlaceFor(tile.id));
        }

        function getPlaceFor(index:uint):Point {
            var result:Point = new Point();
            result.setTo(index % tilesPerLine, Math.floor(index / tilesPerLine));
            result.x *= tilesPerLine;
            result.y *= tilesPerLine;
            return result;
        }

        return result;
    }

    public function getModel():JimModel {
        return model;
    }

    private function saveResults():void {
        model.numTiles = numTiles;
        model.tiles = createBitmapDataFromHashedTiles();

        var file:ByteArray = JimConverter.encode(model);
//        var decodedModel:JimModel = JimConverter.decode(file);
        !1;
        var fr:FileReference = new FileReference();
        fr.save(file, "map.jim");
    }
}
}
