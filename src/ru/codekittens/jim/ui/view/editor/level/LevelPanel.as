package ru.codekittens.jim.ui.view.editor.level {

import flashx.textLayout.formats.VerticalAlign;

import mx.core.UIComponent;

import ru.codekittens.jim.App;
import ru.codekittens.jim.ui.UIHelper;

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
    private var smbXPosition:NumericStepper;
    private var smbYPosition:NumericStepper;

    public function LevelPanel() {
        paddingBottom = paddingLeft = paddingRight = paddingTop = 10;
        gap = 10;

        //Header

        addElement(createHeader("Level"));

        //Title
        txtTitle = new TextInput();
        txtTitle.width = App.settings.FORM_INPUT_WIDTH;
        addElement(UIHelper.createFormGroup(UIHelper.createFormLabel("Title:"), txtTitle));

        //Scroll type
        lstScrollType = new DropDownList();
        addElement(UIHelper.createFormGroup(UIHelper.createFormLabel("Scroll type:"), lstScrollType));

        //Tile size
        smbTileSize = new NumericStepper();
        smbTileSize.stepSize = 8;
        smbTileSize.maximum = 64;
        smbTileSize.minimum = 8;
        smbTileSize.value = 16;
        addElement(UIHelper.createFormGroup(UIHelper.createFormLabel("Tile size:"), smbTileSize));

        //Start position:
        addElement(UIHelper.createSubHeader("Start position"));
        smbXPosition = UIHelper.createStepper(App.settings.MIN_POSITION_OFFSET, App.settings.MAX_POSITION_OFFSET);
        addElement(UIHelper.createFormGroup(UIHelper.createFormLabel("X:"), smbXPosition));
//
        smbYPosition = UIHelper.createStepper(App.settings.MIN_POSITION_OFFSET, App.settings.MAX_POSITION_OFFSET);
        addElement(UIHelper.createFormGroup(UIHelper.createFormLabel("Y:"), smbYPosition));


        //Scroll type:
        //Number of layers:
        //Main layer:


        /*
         public var mainLayer:uint;
         public var cameraPath:Vector.<Point>;

         */
    }


    private function createHeader(text:String):Label {
        var result:Label = UIHelper.createFormLabel(text);
        result.setStyle("fontSize", "15");
        return result;
    }


    public function getTxtTitle():TextInput {
        return txtTitle;
    }

    public function getLstScrollType():DropDownList {
        return lstScrollType;
    }


    public function getSmbXPosition():NumericStepper {
        return smbXPosition;
    }

    public function getSmbYPosition():NumericStepper {
        return smbYPosition;
    }
}
}
