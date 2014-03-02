package ru.codekittens.jim.gui.events {
import flash.events.Event;

public class EditorSelectedEvent extends Event {

    public static const EDITOR_SELECTED:String = "editor_selected";

    public function EditorSelectedEvent(type:String) {
        super(type, bubbles, cancelable);
    }
}
}
