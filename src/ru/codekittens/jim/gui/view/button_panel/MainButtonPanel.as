package ru.codekittens.jim.gui.view.button_panel {
import mx.collections.ArrayList;
import mx.controls.MenuBar;
import mx.core.UIComponent;

import ru.codekittens.jim.App;

import spark.components.Button;
import spark.components.ButtonBar;
import spark.components.HGroup;

public class MainButtonPanel extends HGroup {

    protected var buttonBar:ButtonBar;
    protected var btnView:Button;
    protected var btnEditor:Button;

    protected var hGroup:HGroup;

    public function MainButtonPanel() {
        hGroup = new HGroup();
        hGroup.paddingLeft = hGroup.paddingRight = 10.

        btnView = new Button();
        btnView.label = "Viewer";

        btnEditor = new Button();
        btnEditor.label = "Editor";

        buttonBar = new ButtonBar();
        buttonBar.dataProvider = new ArrayList([btnView, btnEditor]);

        addElement(buttonBar);

        var gap:UIComponent = new UIComponent();
        gap.width = 30;
        addElement(gap);
    }

    public function getBtnView():Button {
        return btnView;
    }
}
}
