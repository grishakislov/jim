package ru.codekittens.jim {
import ru.codekittens.jim.gui.presenter.button_panel.EditorMode;
import ru.codekittens.jim.model.JimFile;
import ru.codekittens.jim.model.JimLayer;
import ru.codekittens.jim.model.LayerDefinition;

public class UIModel {

    public var currentFile:JimFile;
    public var currentEditorMode:EditorMode;
    public var currentLayer:JimLayer;

    public function hasLayers():Boolean {
        if (currentFile == null) {
            return false;
        }
        return currentFile.layers.length > 0;
    }

}
}
