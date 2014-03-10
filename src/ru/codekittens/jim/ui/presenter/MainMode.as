package ru.codekittens.jim.ui.presenter {
public class MainMode {
    public static var EDITOR:MainMode = new MainMode(0);
    public static var VIEWER:MainMode = new MainMode(1);

    private var index:uint;

    public function MainMode(index:uint) {
        this.index = index;
    }

    public function getIndex():uint {
        return index;
    }

}
}
