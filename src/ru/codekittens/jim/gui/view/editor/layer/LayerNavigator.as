package ru.codekittens.jim.gui.view.editor.layer {
import mx.containers.TabNavigator;

import ru.codekittens.jim.App;

import spark.components.VGroup;

public class LayerNavigator extends VGroup {

    private var layerTab:TabNavigator;

    public function LayerNavigator() {
//        paddingBottom = App.settings.SCANNER_PANEL_PADDING;
        paddingTop = 4;
        paddingLeft = App.settings.SCANNER_PANEL_PADDING;
        paddingRight = App.settings.SCANNER_PANEL_PADDING;

        layerTab = new TabNavigator();
        layerTab.width = 582;
        addElement(layerTab);
    }

    public function getLayerTab():TabNavigator {
        return layerTab;
    }
}
}
