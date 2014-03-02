package ru.codekittens.jim.gui.events {
import flash.events.Event;

public class EditorSelectedEvent extends Event {

    public static const SCANNER_SELECTED:String = "scanner_selected";

    public function EditorSelectedEvent(type:String) {
        super(type, bubbles, cancelable);
    }
}
}
