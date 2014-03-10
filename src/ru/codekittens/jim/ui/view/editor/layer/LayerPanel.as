package ru.codekittens.jim.ui.view.editor.layer {
import spark.components.VGroup;

public class LayerPanel extends VGroup {

    private var imageLoaderPanel:ImageLoaderPanel;
    private var layerNavigator:LayerNavigator;
    private var emptyLayerNavigator:EmptyLayerNavigator;

    public function LayerPanel() {
        var vGroup:VGroup = new VGroup();
        addElement(vGroup);

        imageLoaderPanel = new ImageLoaderPanel();
        vGroup.addElement(imageLoaderPanel);
        emptyLayerNavigator = new EmptyLayerNavigator();
        layerNavigator = new LayerNavigator();
    }

    public function getImageLoaderPanel():ImageLoaderPanel {
        return imageLoaderPanel;
    }


    public function getLayerNavigator():LayerNavigator {
        return layerNavigator;
    }

    public function getEmptyLayerNavigator():EmptyLayerNavigator {
        return emptyLayerNavigator;
    }
}
}
