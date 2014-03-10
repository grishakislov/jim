package ru.codekittens.jim.ui.view.button_panel {
import mx.collections.ArrayList;
import mx.controls.Label;

import spark.components.Button;
import spark.components.ButtonBar;
import spark.components.HGroup;
import spark.components.VGroup;

public class MainButtonPanel extends HGroup {

    private var buttonBar:ButtonBar;
    private var btnViewer:Button;
    private var btnEditor:Button;

    private var vGroup:VGroup;

    private var editorGroup:EditorButtonGroup;
    private var viewerGroup:ViewerButtonGroup;

    public function MainButtonPanel() {
        paddingLeft = paddingRight = paddingTop = paddingBottom = 10;
        gap = 100;
        vGroup = new VGroup();
        var label:Label = new Label();
        label.text = "Mode:"
        label.setStyle("color", "0xFFFFFF")

        btnEditor = new Button();
        btnEditor.label = "Editor";

        btnViewer = new Button();
        btnViewer.label = "Viewer";

        buttonBar = new ButtonBar();
        buttonBar.dataProvider = new ArrayList([btnEditor, btnViewer]);

        vGroup.addElement(label);
        vGroup.addElement(buttonBar);

        addElement(vGroup);

        viewerGroup = new ViewerButtonGroup();
        editorGroup = new EditorButtonGroup();
    }

    public function getBtnViewer():Button {
        return btnViewer;
    }

    public function getBtnEditor():Button {
        return btnEditor;
    }

    public function getButtonBar():ButtonBar {
        return buttonBar;
    }

    public function getEditorGroup():EditorButtonGroup {
        return editorGroup;
    }

    public function getViewerGroup():ViewerButtonGroup {
        return viewerGroup;
    }
}
}
