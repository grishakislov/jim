package ru.codekittens.jim.gui.presenter.editor {
import ru.codekittens.jim.App;
import ru.codekittens.jim.UIModel;
import ru.codekittens.jim.gui.events.ImageLoadedEvent;
import ru.codekittens.jim.gui.events.LayersChangedEvent;
import ru.codekittens.jim.gui.view.editor.EditorPanel;
import ru.codekittens.jim.model.JimLayer;
import ru.codekittens.jim.scanner.Scanner;

public class LayerPanelPresenter {

    private var view:EditorPanel;
    private var imageLoaderPresenter:ImageLoaderPresenter;
    private var layerGroupPanelPresenter:LayerNavigatorPresenter;

    public function LayerPanelPresenter(view:EditorPanel) {
        this.view = view;
        view.getLayerPanel().visible = false;
        imageLoaderPresenter = new ImageLoaderPresenter(view.getImageLoaderPanel());
        layerGroupPanelPresenter = new LayerNavigatorPresenter(view.getLayerPanel());

        App.eventBus.addEventListener(ImageLoadedEvent.IMAGE_LOADED, function (event:ImageLoadedEvent):void {
            var layer:JimLayer = Scanner.scan(event.getImage(), event.getTileSize());

            view.getLayerPanel().visible = true;
            //TODO: create new/update existing
            layerGroupPanelPresenter.addNewLayer(layer);
            App.uiModel.currentLayers.push(layer);
            App.eventBus.dispatchEvent(new LayersChangedEvent(LayersChangedEvent.LAYERS_CHANGED));
        });
    }



}
}
