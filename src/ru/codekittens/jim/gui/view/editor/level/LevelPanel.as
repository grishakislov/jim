package ru.codekittens.jim.gui.view.editor.level {

import flashx.textLayout.formats.VerticalAlign;

import mx.collections.ArrayList;
import mx.core.UIComponent;

import ru.codekittens.jim.App;
import ru.codekittens.jim.model.ScrollType;

import spark.components.DropDownList;

import spark.components.HGroup;
import spark.components.Label;
import spark.components.TextInput;

import spark.components.VGroup;

public class LevelPanel extends VGroup{

    private var txtTitle:TextInput;
    private var lstScrollType:DropDownList;

    public function LevelPanel() {
        paddingBottom = paddingLeft = paddingRight = paddingTop = 10;
        gap = 10;

        var header:Label = new Label();
        header.text = "Level";
        header.setStyle("color", "0xFFFFFF");
        header.setStyle("fontSize", "15");
        addElement(header);

        var lblTitle:Label = new Label();
        lblTitle.setStyle("color", "0xFFFFFF");
        lblTitle.text = "Title:";
        txtTitle = new TextInput();
        txtTitle.width = 200;
        addElement(createHGroup(lblTitle, txtTitle));


        var lblScrollType:Label = new Label();
        lblScrollType.setStyle("color", "0xFFFFFF");
        lblScrollType.text = "Scroll type";
        lstScrollType = new DropDownList();
        addElement(createHGroup(lblScrollType, lstScrollType));



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
