package ru.codekittens.jim.gui.view.button_panel {
import mx.collections.ArrayList;
import mx.controls.Button;

import spark.components.ButtonBar;
import spark.components.Label;
import spark.components.VGroup;
import spark.layouts.VerticalAlign;

public class EditorButtonGroup extends MainButtonPanel {

    private var editorButtonBar:ButtonBar;
    private var btnLevel:Button;
    private var btnLayers:Button;
    private var btnPath:Button;

    public function EditorButtonGroup() {
        vGroup = new VGroup();
        vGroup.paddingLeft = vGroup.paddingRight = 10.
        vGroup.verticalAlign = VerticalAlign.MIDDLE;

        var label:Label = new Label();
        label.text = "Editor:"

        btnLevel = new Button();
        btnLevel.label = "Level";

        btnLayers = new Button();
        btnLayers.label = "Layers";

        btnPath = new Button();
        btnPath.label = "Path";
        btnPath.enabled = false; //TODO:

        editorButtonBar = new ButtonBar();
        editorButtonBar.dataProvider = new ArrayList([btnLevel, btnLayers, btnPath]);

        vGroup.addElement(label);
        vGroup.addElement(editorButtonBar);

        addElement(vGroup);
    }
}
}
