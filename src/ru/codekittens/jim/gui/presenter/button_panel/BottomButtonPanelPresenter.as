package ru.codekittens.jim.gui.presenter.button_panel {
import ru.codekittens.jim.App;
import ru.codekittens.jim.gui.events.LayersChangedEvent;
import ru.codekittens.jim.gui.events.UIModeChangedEvent;
import ru.codekittens.jim.gui.presenter.MainMode;
import ru.codekittens.jim.gui.view.button_panel.MainButtonPanel;

import spark.events.IndexChangeEvent;

public class BottomButtonPanelPresenter {

    private var view:MainButtonPanel;

    public function BottomButtonPanelPresenter(view:MainButtonPanel) {
        this.view = view;

        var editorButtonGroupPresenter:EditorButtonGroupPresenter = new EditorButtonGroupPresenter(view.getEditorGroup());

        App.eventBus.addEventListener(LayersChangedEvent.TYPE, function (event:LayersChangedEvent):void {
//            view.getBtnViewer().enabled = App.uiModel.hasLayers();
        });


        view.getButtonBar().addEventListener(IndexChangeEvent.CHANGE, function (event:IndexChangeEvent):void {
            switch (event.newIndex) {
                case MainMode.EDITOR.getIndex():
                    if (view.containsElement(view.getViewerGroup())) {
                        view.removeElement(view.getViewerGroup());
                    }
                    view.addElement(view.getEditorGroup());
                    view.getEditorGroup().getEditorButtonBar().selectedIndex = 0;//Level
                    App.eventBus.dispatchEvent(new UIModeChangedEvent(UIModeChangedEvent.TYPE, UIMode.EDITOR));
                    break;

                case MainMode.VIEWER.getIndex():
                    if (view.containsElement(view.getEditorGroup())) {
                        view.removeElement(view.getEditorGroup());
                    }
                    view.addElement(view.getViewerGroup());
                    view.getViewerGroup().getViewerButtonBar().selectedIndex = 1;//2x
                    App.eventBus.dispatchEvent(new UIModeChangedEvent(UIModeChangedEvent.TYPE, UIMode.VIEWER));
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
