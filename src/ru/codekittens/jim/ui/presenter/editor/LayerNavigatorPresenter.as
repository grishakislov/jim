package ru.codekittens.jim.ui.presenter.editor {
import flash.display.BitmapData;
import flash.events.Event;
import flash.utils.Dictionary;

import mx.events.IndexChangedEvent;
import mx.messaging.events.ChannelEvent;

import ru.codekittens.jim.App;
import ru.codekittens.jim.model.LayerDefinition;
import ru.codekittens.jim.ui.view.editor.layer.LayerItem;
import ru.codekittens.jim.ui.view.editor.layer.LayerNavigator;
import ru.codekittens.jim.model.JimLayer;
import ru.codekittens.jim.scanner.JimHelper;

import spark.components.NumericStepper;

public class LayerNavigatorPresenter {

    private var view:LayerNavigator;
    private var layers:Dictionary;

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
        bindLayerItem(newLayerPanel);
        view.getLayerTab().addItem(newLayerPanel);
        view.getLayerTab().selectedIndex = App.uiModel.currentFile.layers.length - 1;
    }

    private function bindLayerItem(item:LayerItem):void {

        item.getSmbRepeatX().addEventListener(Event.CHANGE, function(event:Event):void {
            var stepper:NumericStepper = NumericStepper(event.target);
            App.uiModel.currentLayer.definition.repeatX = stepper.value;
        });

        item.getSmbRepeatY().addEventListener(Event.CHANGE, function(event:Event):void {
            var stepper:NumericStepper = NumericStepper(event.target);
            App.uiModel.currentLayer.definition.repeatY = stepper.value;
        });

        item.getSmbOffsetX().addEventListener(Event.CHANGE, function(event:Event):void {
            var stepper:NumericStepper = NumericStepper(event.target);
            App.uiModel.currentLayer.definition.startOffsetX = stepper.value;
        });

        item.getSmbOffsetY().addEventListener(Event.CHANGE, function(event:Event):void {
            var stepper:NumericStepper = NumericStepper(event.target);
            App.uiModel.currentLayer.definition.startOffsetY = stepper.value;
        });


    }

    private function unbindLayerItem():void {

    }

    private function populateLayerPanel(panel:LayerItem, layer:JimLayer):void {
        panel.getLayerTitle().text = layer.definition.title;
        panel.label = layer.definition.title;
        panel.getSmbRepeatX().value = layer.definition.repeatX;
        panel.getSmbRepeatY().value = layer.definition.repeatY;
        var bitmapData:BitmapData = JimHelper.convertTilesDictionaryToBitmapData(layer);
        panel.getLayerTiles().source = bitmapData;
    }
}
}
