package ru.codekittens.jim.viewer {
import flash.ui.Keyboard;

public class ViewerKeymap {

    private var vertical:ViewerDirection;
    private var horizontal:ViewerDirection;

    public function keyDown(keyCode:uint):void {
        var direction:ViewerDirection = getDirectionByKey(keyCode);

        if (direction == null) {
            return;
        }

        if (direction.isHorizontal()) {
            horizontal = direction;
        }

        if (direction.isVertical()) {
            vertical = direction;
        }
    }

    public function keyUp(keyCode:uint):void {
        var direction:ViewerDirection = getDirectionByKey(keyCode);
        if (direction == null) {
            return;
        }

        if (direction.isHorizontal()) {
            if (direction.equals(horizontal)) {
                horizontal = null;
            }
        }

        if (direction.isVertical()) {
            if (direction.equals(vertical)) {
                vertical = null;
            }
        }
    }

    private function getDirectionByKey(key:uint):ViewerDirection {
        switch (key) {
            case Keyboard.UP:
                return ViewerDirection.UP;
            case Keyboard.RIGHT:
                return ViewerDirection.RIGHT;
            case Keyboard.DOWN:
                return ViewerDirection.DOWN;
            case Keyboard.LEFT:
                return ViewerDirection.LEFT;
            default:
                return null;
        }
    }

    public function getDirections():Vector.<ViewerDirection> {
        var result:Vector.<ViewerDirection> = new Vector.<ViewerDirection>();

        if (horizontal != null) {
            result.push(horizontal);
        }

        if (vertical != null) {
            result.push(vertical);
        }

        return result;
    }
}
}
