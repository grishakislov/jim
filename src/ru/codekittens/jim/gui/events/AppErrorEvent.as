package ru.codekittens.jim.gui.events {
import flash.events.Event;

public class AppErrorEvent extends Event {

    public static const ERROR:String = "error_event";
    private var message:String;

    public function AppErrorEvent(message:String) {
        this.message = message;
        super (ERROR)
    }

    public function getMessage():String {
        return message;
    }
}
}
