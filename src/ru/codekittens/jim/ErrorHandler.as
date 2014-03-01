package ru.codekittens.jim {
import flashx.textLayout.formats.VerticalAlign;

import mx.containers.Panel;
import mx.controls.Label;

import org.osmf.layout.HorizontalAlign;

import spark.components.HGroup;

import spark.layouts.VerticalLayout;

public class ErrorHandler {

    private var window:JimWindow;

    public function ErrorHandler(window:JimWindow) {
        this.window = window;
    }

    public function error(text:String):void {
        window.removeAllElements();

        var panel:Panel = new Panel();
        panel.width = 350;
        panel.height = 100;
        panel.title = "Error";
        var label:Label = new Label()
        label.text = text;

        panel.addElement(label);

        var hGroup:HGroup = new HGroup();
        hGroup.width = window.width;
        hGroup.height = window.height;
        hGroup.horizontalAlign = HorizontalAlign.CENTER;
        hGroup.verticalAlign = VerticalAlign.MIDDLE;

        hGroup.addElement(panel);

        window.addElement(hGroup);

    }
}
}
