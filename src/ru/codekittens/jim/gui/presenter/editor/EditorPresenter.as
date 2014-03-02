package ru.codekittens.jim.gui.presenter.editor {
import ru.codekittens.jim.App;
import ru.codekittens.jim.gui.events.EditorModeChangedEvent;
import ru.codekittens.jim.gui.presenter.button_panel.EditorMode;
import ru.codekittens.jim.gui.view.editor.EditorPanel;

public class EditorPresenter {

    private var editorPanel:EditorPanel;

    public function EditorPresenter(editorPanel:EditorPanel) {
        editorPanel.addElement(editorPanel.getLevelPanel());
        var levelPanelPresenter:LevelPanelPresenter = new LevelPanelPresenter(editorPanel.getLevelPanel());
        var layerPanelPresenter:LayerPanelPresenter = new LayerPanelPresenter(editorPanel.getLayerPanel());

        App.eventBus.addEventListener(EditorModeChangedEvent.EDITOR_MODE_CHANGED, function (event:EditorModeChangedEvent):void {
            editorPanel.removeAllElements();
            switch (event.getMode()) {
                case EditorMode.LEVEL:
                    editorPanel.addElement(editorPanel.getLevelPanel());
                    break;
                case EditorMode.LAYERS:
                    editorPanel.addElement(editorPanel.getLayerPanel());
                    break;
                case EditorMode.CAMERA:
                    editorPanel.addElement(editorPanel.getCameraPanel());
                    break;
            }
            App.uiModel.currentEditorMode = event.getMode();
        });
    }
}
}
