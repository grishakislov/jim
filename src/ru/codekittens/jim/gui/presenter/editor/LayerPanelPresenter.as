package ru.codekittens.jim.gui.presenter.editor {
import ru.codekittens.jim.App;
import ru.codekittens.jim.gui.events.ImageLoadedEvent;
import ru.codekittens.jim.gui.events.LayersChangedEvent;
import ru.codekittens.jim.gui.view.editor.layer.LayerPanel;
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
        App.eventBus.addEventListener(ImageLoadedEvent.IMAGE_LOADED, function (event:ImageLoadedEvent):void {
            var layer:JimLayer = Scanner.scan(event.getImage(), event.getTileSize());
            App.uiModel.currentFile.layers.push(layer);
            if (view.containsElement(view.getEmptyLayerNavigator())) {
                view.removeElement(view.getEmptyLayerNavigator());
                view.addElement(view.getLayerNavigator());
            }

            switch (event.getMode()) {
                case LayerAddMode.NEW_LAYER:
                    layerNavigatorPresenter.addNewLayer(layer);
                    break;
                case LayerAddMode.CURRENT_LAYER:
                    layerNavigatorPresenter.updateCurrentLayer(layer);
                    break;
            }
            //TODO: create new/update existing

            App.eventBus.dispatchEvent(new LayersChangedEvent(LayersChangedEvent.LAYERS_CHANGED));
        });

    }



}
}
