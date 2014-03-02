package ru.codekittens.jim.gui.presenter.editor {
import flash.display.BitmapData;
import flash.utils.Dictionary;

import ru.codekittens.jim.App;
import ru.codekittens.jim.gui.view.scanner.LayerNavigator;
import ru.codekittens.jim.gui.view.scanner.LayerPanel;
import ru.codekittens.jim.model.JimLayer;
import ru.codekittens.jim.scanner.JimHelper;

public class LayerNavigatorPresenter {

    private var view:LayerNavigator;

    //String layerId, JimLayer layer
    private var layers:Dictionary;

    public function LayerNavigatorPresenter(view:LayerNavigator) {
        this.view = view;
    }

    public function addNewLayer(layer:JimLayer):void {
        App.uiModel.currentLayers.push(layer);
        var newLayerPanel:LayerPanel = new LayerPanel();

        populateLayerPanel(newLayerPanel, layer);
        view.getLayerTab().addItem(newLayerPanel);
    }

    private function populateLayerPanel(panel:LayerPanel, layer:JimLayer):void {
        panel.getLayerTitle().text = layer.definition.title;
        panel.label = layer.definition.title;
        var bitmapData:BitmapData = JimHelper.convertTilesDictionaryToBitmapData(layer);
        panel.getLayerTiles().source = bitmapData;
    }
}
}
