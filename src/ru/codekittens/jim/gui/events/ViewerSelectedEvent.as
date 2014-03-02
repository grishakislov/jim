package ru.codekittens.jim.gui.events {
import flash.events.Event;

import ru.codekittens.jim.model.JimFile;

public class ViewerSelectedEvent extends Event {

    public static const VIEWER_SELECTED:String = "viewer_selected";

    private var file:JimFile;

    public function ViewerSelectedEvent(type:String, file:JimFile) {
        super(type);
        this.file = file;
    }
}
}
