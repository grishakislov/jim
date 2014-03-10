package ru.codekittens.jim.ui.view.editor.layer {
import mx.controls.Label;
import mx.graphics.SolidColorStroke;

import ru.codekittens.jim.App;
import ru.codekittens.jim.ui.UIHelper;

import spark.components.BorderContainer;
import spark.components.HGroup;
import spark.components.Image;
import spark.components.NavigatorContent;
import spark.components.NumericStepper;
import spark.components.TextInput;
import spark.components.VGroup;

public class LayerItem extends NavigatorContent {

    private var txtLayerTitle:TextInput;
    private var smbRepeatX:NumericStepper;
    private var smbRepeatY:NumericStepper;

    private var smbOffsetX:NumericStepper;
    private var smbOffsetY:NumericStepper;

    private var layerTiles:Image;
    private static const PADDING:uint = 10;


    public function LayerItem() {
        var split:HGroup = new HGroup();
        split.paddingBottom = split.paddingLeft = split.paddingRight = split.paddingTop = PADDING;

        var left:VGroup = new VGroup();
        left.paddingTop = 27;

        var right:VGroup = new VGroup();
//        right.paddingTop = right.paddingBottom = 0;

        left.addElement(createLayerInfoBlock());
        right.addElement(createTilesPreviewBlock());

        split.addElement(left);
        split.addElement(right);

        addElement(split);
    }

    private function createLayerInfoBlock():VGroup {
        var layerInfo:VGroup = new VGroup();
//        layerInfo.gap = 10;
        txtLayerTitle = new TextInput();
        layerInfo.addElement(UIHelper.createFormGroup(UIHelper.createFormLabel("Title:", 0), txtLayerTitle));

        //TODO: Hardcode

        smbRepeatX = UIHelper.createStepper(1, 200);
        layerInfo.addElement(UIHelper.createFormGroup(UIHelper.createFormLabel("Repeat X", 0), smbRepeatX));

        smbRepeatY = UIHelper.createStepper(1, 200);
        layerInfo.addElement(UIHelper.createFormGroup(UIHelper.createFormLabel("Repeat Y", 0), smbRepeatY));


        smbOffsetX = UIHelper.createStepper(-200, 200);
        layerInfo.addElement(UIHelper.createFormGroup(UIHelper.createFormLabel("Offset X", 0), smbOffsetX));

        smbOffsetY = UIHelper.createStepper(-200, 200);
        layerInfo.addElement(UIHelper.createFormGroup(UIHelper.createFormLabel("Offset Y", 0), smbOffsetY));


//        var layerTitleLabel:Label = new Label();
//        layerTitleLabel.text = "Title: ";
//        txtLayerInput = new TextInput();
//        layerInfo.addElement(createEditableInfo(layerTitleLabel, txtLayerInput));
        return layerInfo;
    }

//    private function createEditableInfo(label:Label, text:TextInput):HGroup {
//        var result:HGroup = new HGroup();
//        label.width = App.settings.FORM_INDENT;
//        result.addElement(label);
//        result.addElement(text);
//        return result;
//    }

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
        return txtLayerTitle;
    }

    public function getLayerTiles():Image {
        return layerTiles;
    }


    public function getSmbRepeatX():NumericStepper {
        return smbRepeatX;
    }

    public function getSmbRepeatY():NumericStepper {
        return smbRepeatY;
    }

    public function getSmbOffsetX():NumericStepper {
        return smbOffsetX;
    }

    public function getSmbOffsetY():NumericStepper {
        return smbOffsetY;
    }
}
}
