package ru.codekittens.jim.gui.events {
import flash.events.Event;

public class LayersChangedEvent extends Event {

    public static const TYPE:String = "layers_changed";

    public function LayersChangedEvent(type:String) {
        super(type);
    }
}
}
