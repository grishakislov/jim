package ru.codekittens.jim.gui.view.editor.layer {
import mx.controls.Label;
import mx.graphics.SolidColorStroke;

import ru.codekittens.jim.App;

import spark.components.BorderContainer;
import spark.components.HGroup;
import spark.components.Image;
import spark.components.NavigatorContent;
import spark.components.TextInput;
import spark.components.VGroup;

public class LayerItem extends NavigatorContent {

    private var txtLayerInput:TextInput;
    private var layerTiles:Image;
    private static const PADDING:uint = 10;

    public function LayerItem() {
        var hGroup:HGroup = new HGroup();
        hGroup.paddingBottom = hGroup.paddingLeft = hGroup.paddingRight = hGroup.paddingTop = PADDING;

        hGroup.addElement(createLayerInfoBlock());
        hGroup.addElement(createTilesPreviewBlock());
        addElement(hGroup);
    }

    private function createLayerInfoBlock():VGroup {
        var layerInfo:VGroup = new VGroup();

        var layerTitleLabel:Label = new Label();
        layerTitleLabel.text = "Title: ";
        txtLayerInput = new TextInput();
        layerInfo.addElement(createEditableInfo(layerTitleLabel, txtLayerInput));
        return layerInfo;
    }

    private function createEditableInfo(label:Label, text:TextInput):HGroup {
        var result:HGroup = new HGroup();
        label.width = App.settings.FORM_INDENT;
        result.addElement(label);
        result.addElement(text);
        return result;
    }

    private function createTilesPreviewBlock():VGroup {
        var result:VGroup = new VGroup();
        result.paddingLeft = 30;
        var lblPreview:Label = new Label();
        lblPreview.text = "Preview";

        result.addElement(lblPreview);

        var tilesContainer:BorderContainer = new BorderContainer();
        var stroke:SolidColorStroke = new SolidColorStroke();
        stroke.color = 0x999999;
        tilesContainer.borderStroke = stroke;
        layerTiles = new Image();
        tilesContainer.addElement(layerTiles);
        result.addElement(tilesContainer);

        return result;
    }

    public function getLayerTitle():TextInput {
        return txtLayerInput;
    }

    public function getLayerTiles():Image {
        return layerTiles;
    }
}
}
