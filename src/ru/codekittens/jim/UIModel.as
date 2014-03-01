package ru.codekittens.jim {
import ru.codekittens.jim.model.JimLayer;

public class UIModel {

    public var currentLayers:Vector.<JimLayer> = new Vector.<JimLayer>();

    public function hasLayers():Boolean {
        return currentLayers.length > 0;
    }

}
}
