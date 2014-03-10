package ru.codekittens.jim.ui.events {
import flash.events.Event;

public class ImageLoadedEvent extends Event {

    private var model:ImageLoadedModel;

    public static const TYPE:String = "image_loaded_event";

    public function ImageLoadedEvent(type:String, model:ImageLoadedModel) {
        super(type);
        this.model = model;
    }

    public function getModel():ImageLoadedModel {
        return model;
    }
}
}
