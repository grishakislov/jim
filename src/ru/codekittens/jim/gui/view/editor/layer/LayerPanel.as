package ru.codekittens.jim.gui.view.editor.layer {
import flash.display.Bitmap;

import ru.codekittens.jim.Resources;
import ru.codekittens.jim.gui.view.editor.layer.ImageLoaderPanel;
import ru.codekittens.jim.gui.view.editor.layer.LayerNavigator;


import spark.components.SkinnableContainer;
import spark.components.VGroup;

public class LayerPanel extends SkinnableContainer {

    private var imageLoaderPanel:ImageLoaderPanel;
    private var layerGroupPanel:LayerNavigator;

    public function LayerPanel() {
        var vGroup:VGroup = new VGroup();
        addElement(vGroup);

        imageLoaderPanel = new ImageLoaderPanel();
        vGroup.addElement(imageLoaderPanel);

        layerGroupPanel = new LayerNavigator();
        vGroup.addElement(layerGroupPanel);
    }

    public function getImageLoaderPanel():ImageLoaderPanel {
        return imageLoaderPanel;
    }

    public function getLayerPanel():LayerNavigator {
        return layerGroupPanel;
    }
}
}
