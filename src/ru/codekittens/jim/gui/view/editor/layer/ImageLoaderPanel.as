package ru.codekittens.jim.gui.view.editor.layer {
import flash.display.InteractiveObject;
import flash.events.NativeDragEvent;

import flashx.textLayout.formats.VerticalAlign;

import mx.core.UIComponent;
import mx.effects.easing.Back;

import ru.codekittens.jim.App;

import spark.components.Button;
import spark.components.DropDownList;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.NumericStepper;
import spark.components.SkinnableContainer;
import spark.components.VGroup;

public class ImageLoaderPanel extends SkinnableContainer {

    private var vGroup:VGroup;
    private var dragContainer:HGroup;
    private var btnLoad:Button;
    private var lblLayer:Label;
    private var lstLayer:DropDownList;

    public function ImageLoaderPanel() {

        vGroup = new VGroup();
        vGroup.x = vGroup.y = 0;
        vGroup.paddingBottom = App.settings.SCANNER_PANEL_PADDING;
        vGroup.paddingTop = App.settings.SCANNER_PANEL_PADDING;
        vGroup.paddingLeft = App.settings.SCANNER_PANEL_PADDING;
        vGroup.paddingRight = App.settings.SCANNER_PANEL_PADDING;

        addElement(vGroup);
        addLabel();
        addControls();
    }

    private function addLabel():void {
        var headLabel:Label = new Label();
        headLabel.text = "Add image to layer";
        headLabel.setStyle("fontSize", "15")
        headLabel.setStyle("color", "0xFFFFFF")
        vGroup.addElement(headLabel);
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


        hGroup.addElement(createGap());

        dragContainer = new HGroup();
        dragContainer.verticalAlign = VerticalAlign.MIDDLE;
        btnLoad = new Button();
        btnLoad.label = "Browse";
        dragContainer.addElement(btnLoad);

        var dropLabel:Label = new Label();
        dropLabel.text = "Or drop image here"
        dropLabel.setStyle("color", "0xFFFFFF");

        dragContainer.addElement(dropLabel);
        hGroup.addElement(dragContainer);

        vGroup.addElement(hGroup);
    }

    private function createGap():UIComponent {
        var gap:UIComponent = new UIComponent();
        gap.width = 30;
        return gap;
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

    public function getDragContainer():HGroup {
        return dragContainer;
    }
}
}
