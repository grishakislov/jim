package ru.codekittens.jim.gui.events {
import flash.display.Bitmap;
import flash.events.Event;

public class ImageLoadedEvent extends Event {

    private var image:Bitmap;
    private var tileSize:uint;

    public static const IMAGE_LOADED:String = "image_loaded_event";

    public function ImageLoadedEvent(type:String, image:Bitmap, tileSize:uint) {
        super(type);
        this.image = image;
        this.tileSize = tileSize;
    }

    public function getImage():Bitmap {
        return image;
    }

    public function getTileSize():uint {
        return tileSize;
    }
}
}
