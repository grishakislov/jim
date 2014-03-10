package ru.codekittens.jim.gui.presenter.button_panel {
public class UIMode {

    public static var EDITOR:UIMode = new UIMode("editor");
    public static var VIEWER:UIMode = new UIMode("viewer");

    private var mode:String;

    public function UIMode(mode:String) {
        this.mode = mode;
    }

    public function getMode():String {
        return mode;
    }

}
}
