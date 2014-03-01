package ru.codekittens.jim.gui.presenter {
import flash.events.MouseEvent;

import ru.codekittens.jim.App;
import ru.codekittens.jim.gui.events.ModeSelectedEvent;

import ru.codekittens.jim.gui.view.StartScreen;

public class StartScreenPresenter {

    private var view:StartScreen;

    public function StartScreenPresenter(view:StartScreen) {
        this.view = view;

        view.getBtnScanner().addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
            App.eventBus.dispatchEvent(new ModeSelectedEvent(ModeSelectedEvent.SCANNER_SELECTED));
        });

        view.getBtnViewer().addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
            App.eventBus.dispatchEvent(new ModeSelectedEvent(ModeSelectedEvent.VIEWER_SELECTED));
        });
    }
}
}
