package ru.codekittens.jim.ui.presenter.button_panel {
import ru.codekittens.jim.App;
import ru.codekittens.jim.ui.events.EditorModeChangedEvent;
import ru.codekittens.jim.ui.view.button_panel.EditorButtonGroup;

import spark.events.IndexChangeEvent;

public class EditorButtonGroupPresenter {

    private var view:EditorButtonGroup;

    public function EditorButtonGroupPresenter(view:EditorButtonGroup) {
        this.view = view;

        view.getEditorButtonBar().addEventListener(IndexChangeEvent.CHANGE, function (event:IndexChangeEvent):void {
            switch (event.newIndex) {
                case EditorMode.LEVEL.getIndex():
                    App.eventBus.dispatchEvent(new EditorModeChangedEvent(EditorModeChangedEvent.TYPE, EditorMode.LEVEL));
                    break;
                case EditorMode.LAYERS.getIndex():
                    App.eventBus.dispatchEvent(new EditorModeChangedEvent(EditorModeChangedEvent.TYPE, EditorMode.LAYERS));
                    break;
                case EditorMode.CAMERA.getIndex():
                    App.eventBus.dispatchEvent(new EditorModeChangedEvent(EditorModeChangedEvent.TYPE, EditorMode.CAMERA));
                    break;
            }
        });
    }
}
}
