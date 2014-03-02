package ru.codekittens.jim.gui.presenter.button_panel {
import ru.codekittens.jim.App;
import ru.codekittens.jim.gui.events.EditorModeChangedEvent;
import ru.codekittens.jim.gui.view.button_panel.EditorButtonGroup;

import spark.events.IndexChangeEvent;

public class EditorButtonGroupPresenter {

    private var view:EditorButtonGroup;

    public function EditorButtonGroupPresenter(view:EditorButtonGroup) {
        this.view = view;

        view.getEditorButtonBar().addEventListener(IndexChangeEvent.CHANGE, function (event:IndexChangeEvent):void {
            switch (event.newIndex) {
                case EditorMode.LEVEL.getIndex():
                    App.eventBus.dispatchEvent(new EditorModeChangedEvent(EditorModeChangedEvent.EDITOR_MODE_CHANGED, EditorMode.LEVEL));
                    break;
                case EditorMode.LAYERS.getIndex():
                    App.eventBus.dispatchEvent(new EditorModeChangedEvent(EditorModeChangedEvent.EDITOR_MODE_CHANGED, EditorMode.LAYERS));
                    break;
                case EditorMode.CAMERA.getIndex():
                    App.eventBus.dispatchEvent(new EditorModeChangedEvent(EditorModeChangedEvent.EDITOR_MODE_CHANGED, EditorMode.CAMERA));
                    break;
            }
        });
    }
}
}
