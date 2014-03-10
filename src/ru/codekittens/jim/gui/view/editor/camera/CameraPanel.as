package ru.codekittens.jim.gui.view.editor.camera {
import flashx.textLayout.formats.VerticalAlign;

import org.osmf.layout.HorizontalAlign;

import spark.components.HGroup;
import spark.components.Label;

public class CameraPanel extends HGroup{

    public function CameraPanel() {
        width = 640;
        height = 480;
        verticalAlign = VerticalAlign.MIDDLE;
        horizontalAlign = HorizontalAlign.CENTER;

        var label:Label = new Label()
        label.text = "Camera path editor is not available yet"
        label.setStyle("fontSize", "20");
        label.setStyle("color", "0xFFFFFF");
        addElement(label);
    }
}
}
