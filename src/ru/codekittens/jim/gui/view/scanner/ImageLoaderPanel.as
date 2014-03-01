package ru.codekittens.jim.gui.view.scanner {
import flash.events.NativeDragEvent;

import flashx.textLayout.formats.VerticalAlign;

import mx.core.UIComponent;

import spark.components.Button;
import spark.components.DropDownList;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.VGroup;

public class ImageLoaderPanel extends VGroup {

    private var btnLoad:Button;
    private var lblLayer:Label;
    private var lstLayer:DropDownList;

    public static const PADDING:uint = 30;

    public function ImageLoaderPanel() {
        paddingBottom = PADDING;
        paddingTop = PADDING;
        paddingLeft = PADDING;
        paddingRight = PADDING;

        addLabel();
        addControls();
    }

    private function addLabel():void {
        var headLabel:Label = new Label();
        headLabel.text = "Add image to layer";
        headLabel.setStyle("fontSize", "15")
        headLabel.setStyle("color", "0xFFFFFF")
        addElement(headLabel);
    }

    private function addControls():void {
        var hGroup:HGroup = new HGroup();
        hGroup.verticalAlign = VerticalAlign.MIDDLE;

        lblLayer = new Label();
        lblLayer.text = "Target layer:";
        lblLayer.setStyle("color", "0xFFFFFF")
        hGroup.addElement(lblLayer);

        lstLayer = new DropDownList();
        hGroup.addElement(lstLayer);


        var gap:UIComponent = new UIComponent();
        gap.width = 30;
        hGroup.addElement(gap);

        btnLoad = new Button();
        btnLoad.label = "Browse";
        hGroup.addElement(btnLoad);

        var label:Label = new Label();
        label.text = "Or drop image here"
        label.setStyle("color", "0xFFFFFF");

        hGroup.addElement(label);
        addElement(hGroup);
    }

    private function onDragIn(event:NativeDragEvent):void {
    }


    private function onDragDrop(event:NativeDragEvent):void {
    }


    public function getBtnLoad():Button {
        return btnLoad;
    }

    public function getLstLayer():DropDownList {
        return lstLayer;
    }
}
}
