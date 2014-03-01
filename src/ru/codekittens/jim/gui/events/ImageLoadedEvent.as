package ru.codekittens.jim.gui.events {
import flash.display.Bitmap;
import flash.events.Event;

public class ImageLoadedEvent extends Event {

    private var image:Bitmap;

    public function ImageLoadedEvent(image:Bitmap) {
        super("image_loaded_event");
    }

    public function getImage():Bitmap {
        return image;
    }
}
}
