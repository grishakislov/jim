package ru.codekittens.jim.model {
public class ScrollType {

    public static const FULL:ScrollType = new ScrollType(0);
    public static const HORIZONTAL:ScrollType = new ScrollType(1);
    public static const VERTICAL:ScrollType = new ScrollType(2);
    public static const CAMERA_PATH:ScrollType = new ScrollType(3);

    private var id:uint;

    public function ScrollType(id:uint) {
        this.id = id;
    }

    public function getId():uint {
        return id;
    }

    public static function getById(id:uint):ScrollType {
        switch (id) {
            case 0: return FULL;
            case 1: return HORIZONTAL;
            case 2: return VERTICAL;
            case 3: return CAMERA_PATH;
            default: return null
        }
    }
}
}
