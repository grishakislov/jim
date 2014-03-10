package ru.codekittens.jim.ui.events {
import flash.events.Event;

public class InitViewerEvent extends Event {

    public static const TYPE:String = "init_viewer_event";

    public function InitViewerEvent(type:String) {
        super(type);
    }

}
}
