package ru.codekittens.jim.scanner {
import flash.display.BitmapData;

import ru.codekittens.jim.model.JimLayer;

import ru.codekittens.jim.model.LayerDefinition;

public class JimHelper {

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
