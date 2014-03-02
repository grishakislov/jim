package ru.codekittens.jim.gui.presenter.editor {
import ru.codekittens.jim.model.JimLayer;
import ru.codekittens.jim.model.LayerDefinition;

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
        if (name == "Existing layer") {
            return layer.definition.title;
        }
        return name;
    }

    public function getLayer():JimLayer {
        return layer;
    }
}
}
