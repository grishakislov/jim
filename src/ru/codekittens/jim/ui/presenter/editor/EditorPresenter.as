package ru.codekittens.jim.ui.presenter.editor {
import ru.codekittens.jim.App;
import ru.codekittens.jim.ui.events.EditorModeChangedEvent;
import ru.codekittens.jim.ui.presenter.button_panel.EditorMode;
import ru.codekittens.jim.ui.view.editor.EditorPanel;

public class EditorPresenter {

    private var editorPanel:EditorPanel;

    public function EditorPresenter(editorPanel:EditorPanel) {
        editorPanel.addElement(editorPanel.getLevelPanel());
        var levelPanelPresenter:LevelPanelPresenter = new LevelPanelPresenter(editorPanel.getLevelPanel());
        var layerPanelPresenter:LayerPanelPresenter = new LayerPanelPresenter(editorPanel.getLayerPanel());

        App.eventBus.addEventListener(EditorModeChangedEvent.TYPE, function (event:EditorModeChangedEvent):void {
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
