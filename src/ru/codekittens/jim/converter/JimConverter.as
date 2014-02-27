package ru.codekittens.jim.converter {
import deng.fzip.FZip;

import flash.display.BitmapData;
import flash.errors.IllegalOperationError;
import flash.utils.ByteArray;

import ru.codekittens.jim.model.JimModel;

public class JimConverter {

    private static const SIGNATURE:uint = 0x3A33; //:3
    private static const PIC_SIZE:uint = 256;
    private static const MAP_FILE_NAME:String = "map.bin";
    private static const TILES_FILE_NAME:String = "tiles.bin";

    public static function decode(jimFile:ByteArray):JimModel {
        var result:JimModel = new JimModel();

        var zip:FZip = new FZip();
        zip.loadBytes(jimFile);

        var mapData:ByteArray = zip.getFileByName(MAP_FILE_NAME).content;

        var signature:uint = mapData.readUnsignedShort();

        if (signature != SIGNATURE) {
            throw new IllegalOperationError(":3 Error: Invalid file");
        }

        result.width = mapData.readUnsignedShort();
        result.height = mapData.readUnsignedShort();
        result.tileSize = mapData.readByte();
        result.numTiles = mapData.readByte();

        result.map = new ByteArray();
        mapData.readBytes(result.map, 0, result.numTiles);

        var tileData:ByteArray = zip.getFileByName(TILES_FILE_NAME).content;

        var tiles:BitmapData = new BitmapData(PIC_SIZE, PIC_SIZE, true);
        tiles.setPixels(tiles.rect, tileData);

        result.tiles

        return result;
    }

    public static function encode(model:JimModel):ByteArray {

        var dataMap:ByteArray = createDataMap(model);
        var tiles:ByteArray = model.tiles.getPixels(model.tiles.rect);

        var zip:FZip = new FZip();
        zip.addFile(MAP_FILE_NAME, dataMap);
        zip.addFile(TILES_FILE_NAME, tiles);

        var resultByteArray:ByteArray = new ByteArray();
        zip.serialize(resultByteArray);
        return resultByteArray;
    }

    private static function createDataMap(model:JimModel):ByteArray {
        var binary:ByteArray = new ByteArray();
        var numTiles:uint = model.numTiles;

        if (numTiles > 256) {
            throw new IllegalOperationError(":3 Error: Too much tiles");
        }

        binary.writeShort(SIGNATURE);
        binary.writeShort(model.width);
        binary.writeShort(model.height);

        binary.writeByte(model.tileSize);

        binary.writeByte(numTiles);

        binary.writeBytes(model.map);

        return binary;
    }

}
}
