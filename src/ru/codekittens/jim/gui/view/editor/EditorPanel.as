package ru.codekittens.jim.gui.view.editor {
import ru.codekittens.jim.gui.presenter.editor.*;
import ru.codekittens.jim.gui.view.editor.LayerPanel;

import spark.components.VGroup;

public class EditorPanel extends VGroup {

    private var layerPanel:LayerPanel;
    private var levelPanel:LevelPanel;

    public function EditorPanel() {

    }

    public function getLayerPanel():LayerPanel {
        return layerPanel;
    }

    public function getLevelPanel():LevelPanel {
        return levelPanel;
    }
}
}
