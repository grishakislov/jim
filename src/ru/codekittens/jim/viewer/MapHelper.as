package ru.codekittens.jim.viewer {

import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;

import ru.codekittens.jim.model.JimLayer;
import ru.codekittens.jim.model.LayerDefinition;
import ru.codekittens.jim.scanner.JimHelper;

internal class MapHelper {

    public static function loadLayer(layer:JimLayer):BitmapData {
        var def:LayerDefinition = layer.definition;
        var bitmapWidth:uint = def.width * def.tileSize;
        var bitmapHeight:uint = def.height * def.tileSize;
        var bitmapData:BitmapData = new BitmapData(bitmapWidth, bitmapHeight, true, 0);

        var dictionary:BitmapData = JimHelper.convertTilesDictionaryToBitmapData(layer)

        var currentId:uint;

        for (var i:uint = 0; i < layer.map.length; i++) {
            currentId = layer.map.readByte();
            var dictionaryPoint:Point = getDictionaryPointById(currentId, def.tileSize);
            var targetPoint:Point = new Point();
            targetPoint.x = (i % def.width) * def.tileSize;
            targetPoint.y = Math.floor(i / def.width) * def.tileSize;
            bitmapData.copyPixels(dictionary, new Rectangle(dictionaryPoint.x, dictionaryPoint.y, def.tileSize, def.tileSize), targetPoint);
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


}
}
