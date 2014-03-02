package ru.codekittens.jim.gui.presenter.editor {
import mx.collections.ArrayList;

import ru.codekittens.jim.App;
import ru.codekittens.jim.gui.view.editor.level.LevelPanel;
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

    }
}
}
