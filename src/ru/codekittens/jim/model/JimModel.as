package ru.codekittens.jim.model {
import flash.display.BitmapData;
import flash.utils.ByteArray;

public class JimModel {

    public var height:uint;
    public var width:uint;
    public var tileSize:uint;
    public var numTiles:uint;
    public var name:String;

    public var map:ByteArray;
    public var tiles:BitmapData;

}
}
