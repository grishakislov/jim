package ru.codekittens.jim.ui {
import mx.core.UIComponent;

import ru.codekittens.jim.App;

import spark.components.HGroup;

import spark.components.Label;
import spark.components.NumericStepper;
import spark.components.VGroup;
import spark.layouts.VerticalAlign;

public class UIHelper {

    public static function createStepper(min:int, max:int):NumericStepper {
        var result:NumericStepper = new NumericStepper();
        result.minimum = min;
        result.maximum = max;
        result.value = 0;
        return result;
    }

    public static function createSubHeader(text:String, color:uint = 0xFFFFFF):UIComponent {
        var result:VGroup = new VGroup();
        var gap:UIComponent = new UIComponent();
        gap.height = 20;

        var label:Label = createFormLabel(text, color);
        label.setStyle("fontSize", "14");

        result.addElement(gap);
        result.addElement(label);
        return result;
    }

    public static function createFormLabel(text:String, color:uint = 0xFFFFFF):Label {
        var result:Label = new Label();
        result.setStyle("color", color.toString());
        result.text = text;
        return result;
    }

    public static function createFormGroup(element1:Label, element2:UIComponent):HGroup {
        var result:HGroup = new HGroup();
        result.verticalAlign = VerticalAlign.MIDDLE;
        result.paddingLeft = 15;
        element1.width = App.settings.FORM_INDENT;
        result.addElement(element1);
        result.addElement(element2);
        return result;

    }


}
}
