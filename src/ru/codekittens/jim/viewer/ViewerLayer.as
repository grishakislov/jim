package ru.codekittens.jim.viewer {
import flash.display.Bitmap;

public class ViewerLayer {

    public var bitmap:Bitmap;
    public var x:Number;
    public var y:Number;
    public var relativeWidth:Number;
    public var relativeHeight:Number;

    public function updatePosition():void {
        bitmap.x = int(x);
        bitmap.y = int(y);
    }

}
}
