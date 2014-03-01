package ru.codekittens.jim.gui.view.scanner {
import flash.desktop.ClipboardFormats;
import flash.events.NativeDragEvent;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.utils.ByteArray;

import flashx.textLayout.formats.VerticalAlign;

import mx.containers.HBox;
import mx.managers.DragManager;

import spark.components.Button;
import spark.components.HGroup;
import spark.components.Label;

public class ImageLoaderPanel extends HGroup {

    private var btnLoad:Button;
    public static const PADDING:uint = 10;

    public function ImageLoaderPanel() {
        verticalAlign = VerticalAlign.MIDDLE;

        paddingBottom = PADDING;
        paddingTop = PADDING;
        paddingLeft = PADDING;
        paddingRight = PADDING;
        btnLoad = new Button();
        btnLoad.label = "Browse";
        addElement(btnLoad);

        var label:Label = new Label();
        label.text = "Or drop image here"
        label.setStyle("color", "0xFFFFFF");

        addElement(label);

    }

    private function onDragIn(event:NativeDragEvent):void {
    }


    private function onDragDrop(event:NativeDragEvent):void {
    }


    public function getBtnLoad():Button {
        return btnLoad;
    }
}
}
