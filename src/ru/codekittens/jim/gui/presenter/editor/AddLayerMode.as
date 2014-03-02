package ru.codekittens.jim.gui.presenter.editor {
import ru.codekittens.jim.model.JimLayer;

public class AddLayerMode {

    public static const NEW_LAYER:AddLayerMode = new AddLayerMode("new_layer");
    public static const CURRENT_LAYER:AddLayerMode = new AddLayerMode("new_layer");

    private var id:String;
    private var layer:JimLayer;

    public function AddLayerMode(id:String, layer:JimLayer = null) {
        this.id = id;
        this.layer = layer;
    }

    public function getId():String {
        return id;
    }
}
}
