package ru.codekittens.jim.viewer {

import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.ByteArray;

import jim_model.JimLayer;
import jim_model.LayerDefinition;

internal class MapHelper {

    public static function loadLayer(layer:JimLayer, definition:LayerDefinition):BitmapData {
        var bitmapWidth:uint = definition.width * definition.tileSize;
        var bitmapHeight:uint = definition.height * definition.tileSize;
        var bitmapData:BitmapData = new BitmapData(bitmapWidth, bitmapHeight, true, 0);

        var dictionary:BitmapData = createDictionaryBitmapData(layer.tileDictionary);

        var currentId:uint;

        for (var i:uint = 0; i < layer.map.length; i++) {
            currentId = layer.map.readByte();
            var dictionaryPoint:Point = getDictionaryPointById(currentId, definition.tileSize);
            var targetPoint:Point = new Point();
            targetPoint.x = (i % definition.width) * definition.tileSize;
            targetPoint.y = Math.floor(i / definition.width) * definition.tileSize;
            bitmapData.copyPixels(dictionary, new Rectangle(dictionaryPoint.x, dictionaryPoint.y, definition.tileSize, definition.tileSize), targetPoint);
        }

        dictionary.dispose();
        return bitmapData;
    }

    private static function getDictionaryPointById(id:uint, tileSize:uint):Point {
        var result:Point = new Point();
        const TILES_IN_ROW:uint = 16;
        result.x = id % TILES_IN_ROW;
        result.y = Math.floor(id / TILES_IN_ROW);
        result.x *= tileSize;
        result.y *= tileSize;
        return result;
    }

    private static function createDictionaryBitmapData(data:ByteArray):BitmapData {
        var result:BitmapData = new BitmapData(256, 256, true, 0);
        result.setPixels(result.rect, data);
        return result;
    }

}
}
