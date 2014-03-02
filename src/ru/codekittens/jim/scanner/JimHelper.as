package ru.codekittens.jim.scanner {
import flash.display.BitmapData;
import flash.geom.Point;

import ru.codekittens.jim.model.JimFile;
import ru.codekittens.jim.model.JimFileHead;

import ru.codekittens.jim.model.JimLayer;

import ru.codekittens.jim.model.LayerDefinition;
import ru.codekittens.jim.model.ScrollType;

public class JimHelper {

    public static function createEmptyJimFile():JimFile {
        var file:JimFile = new JimFile();

        var head:JimFileHead = new JimFileHead();
        head.title = "New level";
        head.tileSize = 16;
        head.scrollType = ScrollType.FULL;
        head.numLayers = 0;
        head.startPosition = new Point(0,0);

        file.head = head;
        file.layers = new Vector.<JimLayer>();

        return file;
    }

    public static function createEmptyLayerDefinition(tileSize:uint):LayerDefinition {
        var result:LayerDefinition = new LayerDefinition();
        result.title = "New layer";
        result.tileSize = tileSize;
        return result;
    }

    public static function convertTilesDictionaryToBitmapData(layer:JimLayer):BitmapData {
        var result:BitmapData = new BitmapData(256, 256, true, 0);
        result.setPixels(result.rect, layer.tileDictionary);
        return result;
    }
}
}
