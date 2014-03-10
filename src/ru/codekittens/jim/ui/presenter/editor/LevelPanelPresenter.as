package ru.codekittens.jim.ui.presenter.editor {
import flash.events.Event;

import mx.collections.ArrayList;
import mx.events.NumericStepperEvent;

import ru.codekittens.jim.App;
import ru.codekittens.jim.ui.view.editor.level.LevelPanel;
import ru.codekittens.jim.model.ScrollType;

public class LevelPanelPresenter {
    private var view:LevelPanel;

    public function LevelPanelPresenter(view:LevelPanel) {
        this.view = view;

        view.getTxtTitle().text = App.uiModel.currentFile.head.title;

        view.getLstScrollType().dataProvider = new ArrayList([
            ScrollType.FULL.getName(),
            ScrollType.VERTICAL.getName(),
            ScrollType.HORIZONTAL.getName(),
            ScrollType.CAMERA_PATH.getName()
        ]);

        view.getLstScrollType().prompt = App.uiModel.currentFile.head.scrollType.getName();

        view.getSmbXPosition().addEventListener(Event.CHANGE, function (event:Event):void {
            App.uiModel.currentFile.head.startPosition.x += view.getSmbXPosition().value;
        });

        view.getSmbYPosition().addEventListener(Event.CHANGE, function (event:Event):void {
            App.uiModel.currentFile.head.startPosition.y += view.getSmbYPosition().value;
        });

    }
}
}
