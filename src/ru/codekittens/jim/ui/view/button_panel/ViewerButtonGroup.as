package ru.codekittens.jim.ui.view.button_panel {
import mx.collections.ArrayList;

import spark.components.Button;
import spark.components.ButtonBar;
import spark.components.Label;
import spark.components.VGroup;

public class ViewerButtonGroup extends VGroup {

    private var viewerButtonBar:ButtonBar;
    private var btn1x:Button;
    private var btn2x:Button;
    private var btn3x:Button;

    public function ViewerButtonGroup() {
        paddingTop = 5;
        gap = 10;
        var label:Label = new Label();
        label.text = "Scale:"
        label.setStyle("color", "0xFFFFFF")

        btn1x = new Button();
        btn1x.label = "1x";

        btn2x = new Button();
        btn2x.label = "2x";

        btn3x = new Button();
        btn3x.label = "3x";

        viewerButtonBar = new ButtonBar();
        viewerButtonBar.dataProvider = new ArrayList([btn1x, btn2x, btn3x]);

        addElement(label);
        addElement(viewerButtonBar);

    }

    public function getViewerButtonBar():ButtonBar {
        return viewerButtonBar;
    }
}
}
