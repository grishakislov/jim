package ru.codekittens.jim.gui.events {
import flash.events.Event;

public class ModeSelectedEvent extends Event {

    public static const SCANNER_SELECTED:String = "scanner_selected";
    public static const VIEWER_SELECTED:String = "viewer_selected";

    public function ModeSelectedEvent(type:String) {
        super(type, bubbles, cancelable);
    }
}
}
