package ru.codekittens.jim.viewer {
public class ViewerDirection {

    public static const UP:ViewerDirection = new ViewerDirection("up");
    public static const RIGHT:ViewerDirection = new ViewerDirection("right");
    public static const DOWN:ViewerDirection = new ViewerDirection("down");
    public static const LEFT:ViewerDirection = new ViewerDirection("left");

    private var id:String;

    public function ViewerDirection(id:String) {
        this.id = id;
    }

    public function getId():String {
        return id;
    }

    public function isVertical():Boolean {
        return this.equals(UP) || this.equals(DOWN);
    }

    public function isHorizontal():Boolean {
        return this.equals(LEFT) || this.equals(RIGHT);
    }

    public function equals(direction:ViewerDirection):Boolean {
        if (direction == null) {
            return false;
        }
        return id == direction.getId();
    }
}
}
