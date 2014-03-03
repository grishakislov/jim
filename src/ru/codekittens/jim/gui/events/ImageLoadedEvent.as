package ru.codekittens.jim.gui.events {
import flash.display.Bitmap;
import flash.events.Event;

import ru.codekittens.jim.gui.presenter.editor.LayerAddMode;

public class ImageLoadedEvent extends Event {

    private var model:ImageLoadedModel;

    public static const IMAGE_LOADED:String = "image_loaded_event";

    public function ImageLoadedEvent(type:String, model:ImageLoadedModel) {
        super(type);
        this.model = model;
    }

    public function getModel():ImageLoadedModel {
        return model;
    }
}
}
