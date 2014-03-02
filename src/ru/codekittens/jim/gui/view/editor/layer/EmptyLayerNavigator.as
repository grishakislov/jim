package ru.codekittens.jim.gui.view.editor.layer {
import spark.components.Label;
import spark.components.VGroup;
import spark.layouts.HorizontalAlign;
import spark.layouts.VerticalAlign;

public class EmptyLayerNavigator extends VGroup {

    public function EmptyLayerNavigator() {
        width = 640;
        height = 350;

        verticalAlign = VerticalAlign.MIDDLE;
        horizontalAlign = HorizontalAlign.CENTER;

        var label:Label = new Label()
        label.text = "Load image to initialize layer"
        label.setStyle("fontSize", "20");
        label.setStyle("color", "0xFFFFFF");
        addElement(label);

    }
}
}
