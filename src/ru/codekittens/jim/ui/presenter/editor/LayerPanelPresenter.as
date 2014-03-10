package ru.codekittens.jim.ui.presenter.editor {
import ru.codekittens.jim.App;
import ru.codekittens.jim.ui.events.ImageLoadedEvent;
import ru.codekittens.jim.ui.events.LayersChangedEvent;
import ru.codekittens.jim.ui.view.editor.layer.LayerPanel;
import ru.codekittens.jim.model.JimLayer;
import ru.codekittens.jim.scanner.Scanner;

public class LayerPanelPresenter {

    private var view:LayerPanel;
    private var imageLoaderPresenter:ImageLoaderPresenter;
    private var layerNavigatorPresenter:LayerNavigatorPresenter;

    public function LayerPanelPresenter(view:LayerPanel) {
        this.view = view;
        imageLoaderPresenter = new ImageLoaderPresenter(view.getImageLoaderPanel());
        layerNavigatorPresenter = new LayerNavigatorPresenter(view.getLayerNavigator());

        view.addElement(view.getEmptyLayerNavigator());

        App.eventBus.addEventListener(ImageLoadedEvent.TYPE, function (event:ImageLoadedEvent):void {

            prepareContainerForNewLayer();

            switch (event.getModel().mode) {
                case LayerAddMode.NEW_LAYER:
                    handleNewLayer(event);
                    break;
                case LayerAddMode.CURRENT_LAYER:
                    handleCurrentLayer(event)
                    break;
                case LayerAddMode.EXISTING_LAYER:
                    handleExistingLayer(event)
                    break;
            }

            App.eventBus.dispatchEvent(new LayersChangedEvent(LayersChangedEvent.TYPE));
        });

    }

    private function handleNewLayer(event:ImageLoadedEvent):void {
        var layerNum:uint;
        layerNum = App.uiModel.currentFile.layers.length;
        var scannedLayer:JimLayer = Scanner.scan(event.getModel().image, event.getModel().tileSize, layerNum);
        App.uiModel.currentLayer = scannedLayer;
        App.uiModel.currentFile.layers.push(scannedLayer);
        layerNavigatorPresenter.addNewLayer(scannedLayer);

    }

    private function handleCurrentLayer(event:ImageLoadedEvent):void {
        var layerNum:uint;
        layerNum = App.uiModel.currentFile.layers.indexOf(App.uiModel.currentLayer);
        var scannedLayer:JimLayer = Scanner.scan(event.getModel().image, event.getModel().tileSize, layerNum);
        App.uiModel.currentLayer = scannedLayer;

        var currentLayer:JimLayer;

        for (var i:int = 0; i < App.uiModel.currentFile.layers.length; i++) {
            currentLayer = App.uiModel.currentFile.layers[i];
            if (currentLayer == App.uiModel.currentLayer) {
                App.uiModel.currentFile.layers[i] = scannedLayer;
            }
        }
        layerNavigatorPresenter.updateCurrentLayer(scannedLayer);

    }

    private function handleExistingLayer(event:ImageLoadedEvent):void {
        var layerNum:uint;
        var existingLayer:JimLayer = App.uiModel.findLayerByName(event.getModel().mode.getLayer().definition.title);
        layerNum = App.uiModel.currentFile.layers.indexOf(existingLayer);
        var scannedLayer:JimLayer = Scanner.scan(event.getModel().image, event.getModel().tileSize, layerNum);
        App.uiModel.currentLayer = scannedLayer;

        var index:uint;
        var currentLayer:JimLayer;

        for (var i:int = 0; i < App.uiModel.currentFile.layers.length; i++) {
            currentLayer = App.uiModel.currentFile.layers[i];
            if (currentLayer.definition.title == event.getModel().mode.getLayer().definition.title) {
                App.uiModel.currentFile.layers[i] = event.getModel().mode.getLayer();
                index = i;
            }
        }
        layerNavigatorPresenter.updateExistingLayer(App.uiModel.currentLayer, index);

    }

    private function prepareContainerForNewLayer():void {
        if (view.containsElement(view.getEmptyLayerNavigator())) {
            view.removeElement(view.getEmptyLayerNavigator());
            view.addElement(view.getLayerNavigator());
        }
    }

}
}
