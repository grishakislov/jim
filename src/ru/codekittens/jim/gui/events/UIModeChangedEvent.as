package ru.codekittens.jim.gui.events {
import flash.events.Event;

import ru.codekittens.jim.gui.presenter.button_panel.UIMode;

public class UIModeChangedEvent extends Event {

    public static const TYPE:String = "u_mode_changed";

    private var newMode:UIMode;

    public function UIModeChangedEvent(type:String, newMode:UIMode) {
        super(type);
        this.newMode = newMode;
    }

    public function getNewMode():UIMode {
        return newMode;
    }
}
}
