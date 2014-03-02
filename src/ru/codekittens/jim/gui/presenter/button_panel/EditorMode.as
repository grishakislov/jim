package ru.codekittens.jim.gui.presenter.button_panel {
public class EditorMode {

    public static var LEVEL:EditorMode = new EditorMode(0);
    public static var LAYERS:EditorMode = new EditorMode(1);
    public static var CAMERA:EditorMode = new EditorMode(2);

    private var index:uint;

    public function EditorMode(index:uint) {
        this.index = index;
    }

    public function getIndex():uint {
        return index;
    }
}
}
