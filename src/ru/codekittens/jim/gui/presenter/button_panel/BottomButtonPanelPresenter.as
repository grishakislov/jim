package ru.codekittens.jim.gui.presenter.button_panel {
import flash.events.MouseEvent;

import mx.events.IndexChangedEvent;

import mx.events.ItemClickEvent;

import ru.codekittens.jim.App;
import ru.codekittens.jim.gui.events.LayersChangedEvent;
import ru.codekittens.jim.gui.events.EditorSelectedEvent;
import ru.codekittens.jim.gui.events.ViewerSelectedEvent;

import ru.codekittens.jim.gui.view.button_panel.MainButtonPanel;

import spark.events.IndexChangeEvent;


public class BottomButtonPanelPresenter {

    private var view:MainButtonPanel;

    private static var EDITOR:uint = 0;
    private static var VIEWER:uint = 0;

    public function BottomButtonPanelPresenter(view:MainButtonPanel) {
        this.view = view;



        App.eventBus.addEventListener(LayersChangedEvent.LAYERS_CHANGED, function(event:LayersChangedEvent):void {
//            view.getBtnViewer().enabled = App.uiModel.hasLayers();
        });


        view.getButtonBar().addEventListener(IndexChangeEvent.CHANGE, function(event:IndexChangeEvent):void {
            switch (event.newIndex) {
                case EDITOR:
                    if (view.containsElement(view.getViewerGroup())) {
                        view.removeElement(view.getViewerGroup());
                    }
                    view.addElement(view.getEditorGroup());
                    view.getEditorGroup().getEditorButtonBar().selectedIndex = 0;//Level
                    //TODO: get file
//                    App.eventBus.dispatchEvent(new ViewerSelectedEvent(ViewerSelectedEvent.VIEWER_SELECTED, null))
                    break;

                case VIEWER:
                    if (view.containsElement(view.getEditorGroup())) {
                        view.removeElement(view.getEditorGroup());
                    }
                    view.addElement(view.getViewerGroup());
                    view.getViewerGroup().getViewerButtonBar().selectedIndex = 1;//2x
//                    App.eventBus.dispatchEvent(new EditorSelectedEvent(EditorSelectedEvent.EDITOR_SELECTED));
                    break;
            }
        });


//        view.getBtnScanner().addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
//            App.eventBus.dispatchEvent(new EditorSelectedEvent(EditorSelectedEvent.EDITOR_SELECTED));
//        });
//
//        view.getBtnViewer().addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
//            //TODO: Browse and load file
//            var fileReference:FileReference = new FileReference();
//
//            fileReference.addEventListener(Event.SELECT, function (event:Event):void {
//                fileReference.load();
//            });
//
//            fileReference.addEventListener(Event.COMPLETE, function (event:Event):void {
//                var file:JimFile;
//                var byteArray:ByteArray = (event.target as FileReference).data;
////                file = JimConverter.decode(byteArray);
//                App.eventBus.dispatchEvent(new ViewerSelectedEvent(ViewerSelectedEvent.VIEWER_SELECTED, file));
//            });
//
//            fileReference.browse();
//        });


    }
}
}
