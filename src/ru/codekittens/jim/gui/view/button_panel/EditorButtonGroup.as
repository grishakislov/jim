package ru.codekittens.jim.gui.view.button_panel {
import mx.collections.ArrayList;
import mx.controls.Button;

import spark.components.ButtonBar;
import spark.components.Label;
import spark.components.VGroup;

public class EditorButtonGroup extends VGroup {

    private var editorButtonBar:ButtonBar;
    private var btnLevel:Button;
    private var btnLayers:Button;
    private var btnPath:Button;

    public function EditorButtonGroup() {
        paddingTop = 5;
        gap = 10;

        var label:Label = new Label();
        label.text = "Editor:"
        label.setStyle("color", "0xFFFFFF")

        btnLevel = new Button();
        btnLevel.label = "Level";

        btnLayers = new Button();
        btnLayers.label = "Layers";

        btnPath = new Button();
        btnPath.label = "Path";

        editorButtonBar = new ButtonBar();
        editorButtonBar.dataProvider = new ArrayList([btnLevel, btnLayers, btnPath]);

        addElement(label);
        addElement(editorButtonBar);
    }

    public function getEditorButtonBar():ButtonBar {
        return editorButtonBar;
    }
}
}
