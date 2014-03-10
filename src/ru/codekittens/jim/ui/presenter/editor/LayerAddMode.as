package ru.codekittens.jim.ui.presenter.editor {
import ru.codekittens.jim.model.JimLayer;

public class LayerAddMode {

    public static const NEW_LAYER:LayerAddMode = new LayerAddMode("New layer");
    public static const CURRENT_LAYER:LayerAddMode = new LayerAddMode("Current layer");
    public static const EXISTING_LAYER:LayerAddMode = new LayerAddMode("Existing layer");

    private var name:String;
    private var layer:JimLayer;

    public function LayerAddMode(name:String, layer:JimLayer = null) {
        this.name = name;
        this.layer = layer;
    }

    public function getName():String {
        return name;
    }

    public function getLayer():JimLayer {
        return layer;
    }

    public function setLayer(layer:JimLayer):void {
        this.layer = layer;
    }

    public static function getByName(name:String):LayerAddMode {
        switch (name) {
            case NEW_LAYER.getName():
                    return NEW_LAYER;
            case CURRENT_LAYER.getName():
                return CURRENT_LAYER;
            case EXISTING_LAYER.getName():
                return EXISTING_LAYER;
        }
        return null;
    }
}
}
