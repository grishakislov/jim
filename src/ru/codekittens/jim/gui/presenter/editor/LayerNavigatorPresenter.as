package ru.codekittens.jim.gui.presenter.editor {
import flash.display.BitmapData;

import mx.events.IndexChangedEvent;

import ru.codekittens.jim.App;
import ru.codekittens.jim.gui.view.editor.layer.LayerItem;
import ru.codekittens.jim.gui.view.editor.layer.LayerNavigator;
import ru.codekittens.jim.model.JimLayer;
import ru.codekittens.jim.scanner.JimHelper;

public class LayerNavigatorPresenter {

    private var view:LayerNavigator;

    public function LayerNavigatorPresenter(view:LayerNavigator) {
        this.view = view;

        view.getLayerTab().addEventListener(IndexChangedEvent.CHANGE, function(event:IndexChangedEvent):void {
            App.uiModel.currentLayer = App.uiModel.currentFile.layers[event.newIndex];
        });

    }

    public function updateExistingLayer(layer:JimLayer, index:uint):void {
        var currentItem:LayerItem = LayerItem(view.getLayerTab().getChildAt(index));
        populateLayerPanel(currentItem, layer);
    }

    public function updateCurrentLayer(layer:JimLayer):void {
        var currentItem:LayerItem = LayerItem(view.getLayerTab().selectedChild);
        populateLayerPanel(currentItem, layer);
    }

    public function addNewLayer(layer:JimLayer):void {
        var newLayerPanel:LayerItem = new LayerItem();
        populateLayerPanel(newLayerPanel, layer);
        view.getLayerTab().addItem(newLayerPanel);
        view.getLayerTab().selectedIndex = App.uiModel.currentFile.layers.length - 1;
    }

    private function populateLayerPanel(panel:LayerItem, layer:JimLayer):void {
        panel.getLayerTitle().text = layer.definition.title;
        panel.label = layer.definition.title;
        var bitmapData:BitmapData = JimHelper.convertTilesDictionaryToBitmapData(layer);
        panel.getLayerTiles().source = bitmapData;
    }
}
}
