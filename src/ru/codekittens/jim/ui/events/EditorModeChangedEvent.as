package ru.codekittens.jim.ui.events {
import flash.events.Event;

import ru.codekittens.jim.ui.presenter.button_panel.EditorMode;

public class EditorModeChangedEvent extends Event {

    public static const TYPE:String = "editor_mode_changed"

    private var mode:EditorMode;

    public function EditorModeChangedEvent(type:String, mode:EditorMode) {
        super (type);
        this.mode = mode;
    }

    public function getMode():EditorMode {
        return mode;
    }
}
}
