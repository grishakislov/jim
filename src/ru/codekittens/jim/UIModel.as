package ru.codekittens.jim {
import ru.codekittens.jim.ui.presenter.button_panel.EditorMode;
import ru.codekittens.jim.ui.presenter.editor.LayerAddMode;
import ru.codekittens.jim.model.JimFile;
import ru.codekittens.jim.model.JimLayer;

public class UIModel {

    public var currentFile:JimFile;
    public var currentEditorMode:EditorMode;
    public var currentLayerAddMode:LayerAddMode;
    public var currentLayer:JimLayer;

    public function hasLayers():Boolean {
        if (currentFile == null) {
            return false;
        }
        return currentFile.layers.length > 0;
    }

    public function findLayerByName(name:String):JimLayer {
        for each (var jimLayer:JimLayer in currentFile.layers) {
            if (jimLayer.definition.title == name) {
                return jimLayer;
            }
        }
        return null;
    }

}
}
