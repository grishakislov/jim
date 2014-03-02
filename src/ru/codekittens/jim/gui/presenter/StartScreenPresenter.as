package ru.codekittens.jim.gui.presenter {
import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.FileReference;
import flash.utils.ByteArray;

import ru.codekittens.jim.App;
import ru.codekittens.jim.converter.JimConverter;
import ru.codekittens.jim.gui.events.EditorSelectedEvent;
import ru.codekittens.jim.gui.events.ViewerSelectedEvent;
import ru.codekittens.jim.gui.view.StartScreen;
import ru.codekittens.jim.model.JimFile;

public class StartScreenPresenter {

    private var view:StartScreen;

    public function StartScreenPresenter(view:StartScreen) {
        this.view = view;

    }
}
}
