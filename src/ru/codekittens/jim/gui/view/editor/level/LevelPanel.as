package ru.codekittens.jim.gui.view.editor.level {

import flashx.textLayout.formats.VerticalAlign;

import mx.core.UIComponent;

import ru.codekittens.jim.App;

import spark.components.DropDownList;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.NumericStepper;
import spark.components.TextInput;
import spark.components.VGroup;

public class LevelPanel extends VGroup {

    private var txtTitle:TextInput;
    private var lstScrollType:DropDownList;
    private var smbTileSize:NumericStepper;

    public function LevelPanel() {
        paddingBottom = paddingLeft = paddingRight = paddingTop = 10;
        gap = 10;

        //Header
        var header:Label = new Label();
        header.text = "Level";
        header.setStyle("color", "0xFFFFFF");
        header.setStyle("fontSize", "15");
        addElement(header);

        //Title
        var lblTitle:Label = new Label();
        lblTitle.setStyle("color", "0xFFFFFF");
        lblTitle.text = "Title:";
        txtTitle = new TextInput();
        txtTitle.width = 200;
        addElement(createHGroup(lblTitle, txtTitle));

        //Scroll type
        var lblScrollType:Label = new Label();
        lblScrollType.setStyle("color", "0xFFFFFF");
        lblScrollType.text = "Scroll type";
        lstScrollType = new DropDownList();
        addElement(createHGroup(lblScrollType, lstScrollType));

        //Tile size
        var lblTileSize:Label = new Label();
        lblTileSize.setStyle("color", "0xFFFFFF");
        lblTileSize.text = "Tile size";
        smbTileSize = new NumericStepper();
        smbTileSize.stepSize = 8;
        smbTileSize.maximum = 64;
        smbTileSize.minimum = 8;
        smbTileSize.value = 16;
        addElement(createHGroup(lblTileSize, smbTileSize));




        //Scroll type:
        //Number of layers:
        //Main layer:
        //Start position:

        /*
         public var title:String;
         public var scrollType:ScrollType;
         public var numLayers:uint;
         public var mainLayer:uint;
         public var startPosition:Point;
         public var cameraPath:Vector.<Point>;

         */

    }

    private function createHGroup(element1:Label, element2:UIComponent):HGroup {
        var result:HGroup = new HGroup();
        result.verticalAlign = VerticalAlign.MIDDLE;
        result.paddingLeft = 15;
        element1.width = App.settings.FORM_INDENT;
        result.addElement(element1);
        result.addElement(element2);
        return result;

    }

    public function getTxtTitle():TextInput {
        return txtTitle;
    }

    public function getLstScrollType():DropDownList {
        return lstScrollType;
    }
}
}
