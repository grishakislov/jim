package ru.codekittens.jim.model {
public class ScrollType {

    public static const FULL:ScrollType = new ScrollType(0, "Full");
    public static const HORIZONTAL:ScrollType = new ScrollType(1, "Horizontal");
    public static const VERTICAL:ScrollType = new ScrollType(2, "Vertical");
    public static const CAMERA_PATH:ScrollType = new ScrollType(3, "Camera path");

    private var id:uint;
    private var name:String;

    public function ScrollType(id:uint, name:String) {
        this.id = id;
        this.name = name;
    }

    public function getId():uint {
        return id;
    }

    public function getName():String {
        return name;
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

    public static function getByName(name:String):ScrollType {
        switch (name) {
            case "Full": return FULL;
            case "Horizontal": return HORIZONTAL;
            case "Vertical": return VERTICAL;
            case "Camera path": return CAMERA_PATH;
            default: return null
        }
    }


}
}
