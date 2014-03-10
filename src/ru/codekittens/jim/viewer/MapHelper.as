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

        var repeatWidth:uint = def.width * def.tileSize * def.repeatX;
        var repeatHeight:uint = def.height * def.tileSize * def.repeatY;

        var result:BitmapData = new BitmapData(repeatWidth, repeatHeight, true, 0);

        var dictionary:BitmapData = JimHelper.convertTilesDictionaryToBitmapData(layer)

        var currentId:uint;

        var single:BitmapData = new BitmapData(bitmapWidth, bitmapHeight);

        layer.map.position = 0;
        for (var i:uint = 0; i < layer.map.length; i++) {
            currentId = layer.map.readByte();
            var dictionaryPoint:Point = getDictionaryPointById(currentId, def.tileSize);
            var targetPoint:Point = new Point();
            targetPoint.x = (i % def.width) * def.tileSize;
            targetPoint.y = Math.floor(i / def.width) * def.tileSize;
            single.copyPixels(dictionary, new Rectangle(dictionaryPoint.x, dictionaryPoint.y, def.tileSize, def.tileSize), targetPoint);
        }

        //repeat
        var point:Point = new Point();

        for (var y:uint = 0; y < def.repeatY; y++) {
            for (var x:uint = 0; x < def.repeatX; x++) {
                point.setTo(x * single.width, y * single.height);
                result.copyPixels(single, single.rect, point);
            }
        }

        dictionary.dispose();
        return result;
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
