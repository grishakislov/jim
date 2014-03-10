package ru.codekittens.jim.ui.view.editor {
import ru.codekittens.jim.ui.view.editor.camera.CameraPanel;
import ru.codekittens.jim.ui.view.editor.layer.LayerPanel;
import ru.codekittens.jim.ui.view.editor.level.LevelPanel;

import spark.components.VGroup;

public class EditorPanel extends VGroup {

    private var layerPanel:LayerPanel;
    private var levelPanel:LevelPanel;
    private var cameraPanel:CameraPanel;

    public function EditorPanel() {
        layerPanel = new LayerPanel();
        levelPanel = new LevelPanel();
        cameraPanel = new CameraPanel();
    }

    public function getLayerPanel():LayerPanel {
        return layerPanel;
    }

    public function getLevelPanel():LevelPanel {
        return levelPanel;
    }

    public function getCameraPanel():CameraPanel {
        return cameraPanel;
    }
}
}
