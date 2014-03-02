package ru.codekittens.jim.scanner {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.globalization.NationalDigitsType;
import flash.net.FileReference;
import flash.utils.ByteArray;

import ru.codekittens.jim.App;

import ru.codekittens.jim.converter.JimConverter;
import ru.codekittens.jim.model.JimFile;
import ru.codekittens.jim.model.JimLayer;
import ru.codekittens.jim.model.LayerDefinition;

public class Scanner {

    //state
    private static var sourceBitmap:Bitmap;
    private static var currentColumn:uint = 0;
    private static var numTiles:uint = 0;
    private static var currentTile:BitmapData;
    private static var currentRect:Rectangle;
    private static var currentPoint:Point;
    private static var currentId:uint = 0;

    //data
    private static var model:JimLayer;
    private static var hashedTiles:Object;

    public static function scan(source:Bitmap, tileSize:uint):JimLayer {
        sourceBitmap = source;
        var definition:LayerDefinition = JimHelper.createEmptyLayerDefinition(tileSize, App.uiModel.currentFile.layers.length);
        definition.width = source.bitmapData.width / tileSize;
        definition.height = source.bitmapData.height / tileSize;
        hashedTiles = {};
        currentPoint = new Point();
        currentRect = new Rectangle(0, 0, tileSize, tileSize);

        initLayer(definition);

        process();

        return model;
    }

    private static function initLayer(definition:LayerDefinition):void {
        model = new JimLayer();
        model.definition = definition;
        model.map = new ByteArray();

        var totalTiles:uint = model.definition.width * model.definition.height;
        for (var i:int = 0; i < totalTiles; i++) {
            model.map.writeByte(0);
        }
        model.map.position = 0;
    }

    private static function process():void {
        for (var i:int = 0; i < model.definition.width; i++) {
            processNextColumn();
        }
        saveResults();
    }

    private static function processNextColumn():void {
        trace("Processing " + (currentColumn + 1) + " of " + model.definition.width + " columns");

        var currentHash:String;
        var savedTile:SavedTile;
        for (var i:int = 0; i < model.definition.height; i++) {
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

    private static function mapTile(x:uint, y:uint, tile:SavedTile):void {
        var index:uint = y * model.definition.width + x;
        model.map.position = index;
        model.map.writeByte(tile.id);
    }

    private static function saveTile(savedTile:SavedTile):void {
        numTiles++;
        hashedTiles[savedTile.hash] = savedTile;
    }

    private static function getId():uint {
        return currentId++;
    }

    private static function tileNotSaved(hash:String):Boolean {
        return hashedTiles[hash] == null;
    }

    private static function copyNextTile(rowNumber:uint):void {
        var tileSize:uint = model.definition.tileSize;
        currentTile = new BitmapData(tileSize, tileSize, true, 0);
        currentRect.x = currentColumn * tileSize;
        currentRect.y = rowNumber * tileSize;
        currentTile.copyPixels(sourceBitmap.bitmapData, currentRect, currentPoint);
    }

    private static function hash(data:BitmapData):String {
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

    private static function createBitmapDataFromHashedTiles():BitmapData {
        var result:BitmapData = new BitmapData(256, 256, true, 0);
        var tilesPerLine:uint = 256 / model.definition.tileSize;

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

    private static function saveResults():void {
        model.definition.tilesDictionarySize = numTiles;
        var bitmapData:BitmapData = createBitmapDataFromHashedTiles();
        model.tileDictionary = bitmapData.getPixels(bitmapData.rect);
        model.tileDictionary.position = 0;
    }
}
}
