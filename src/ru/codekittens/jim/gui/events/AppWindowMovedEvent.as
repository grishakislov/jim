package ru.codekittens.jim.gui.events {
import flash.events.Event;
import flash.geom.Point;

public class AppWindowMovedEvent extends Event{

    public static const TYPE:String = "app_window_moved";

    private var delta:Point;

    public function AppWindowMovedEvent(type:String, delta:Point) {
        super(type);
        this.delta = delta;
    }
}
}
