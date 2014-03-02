package ru.codekittens.jim.gui.events {
import flash.events.Event;

import ru.codekittens.jim.model.JimLayer;

public class LayersChangedEvent extends Event {

    public static const LAYER_ADDED:String = "layer_added";

    private var layer:JimLayer;

    public function LayersChangedEvent(type:String, layer:JimLayer) {
        super(type);
        this.layer = layer;
    }

    public function getLayer():JimLayer {
        return layer;
    }
}
}
