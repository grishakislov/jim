package ru.codekittens.jim.gui.events {
import flash.display.Bitmap;
import flash.events.Event;

import ru.codekittens.jim.gui.presenter.editor.LayerAddMode;

public class ImageLoadedEvent extends Event {

    private var _mode:LayerAddMode;
    private var image:Bitmap;
    private var tileSize:uint;

    public static const IMAGE_LOADED:String = "image_loaded_event";

    public function ImageLoadedEvent(type:String, image:Bitmap, tileSize:uint, mode:LayerAddMode) {
        super(type);
        this.image = image;
        this.tileSize = tileSize;
        this._mode = mode;
    }

    public function getImage():Bitmap {
        return image;
    }

    public function getTileSize():uint {
        return tileSize;
    }

    public function getMode():LayerAddMode {
        return _mode;
    }
}
}
