package ru.codekittens.jim {
import flash.display.Bitmap;
import flash.events.EventDispatcher;

import ru.codekittens.jim.gui.events.AppErrorEvent;
import ru.codekittens.jim.gui.events.EditorSelectedEvent;
import ru.codekittens.jim.gui.events.ViewerSelectedEvent;
import ru.codekittens.jim.gui.presenter.button_panel.BottomButtonPanelPresenter;
import ru.codekittens.jim.gui.presenter.button_panel.EditorMode;
import ru.codekittens.jim.gui.presenter.editor.EditorPresenter;
import ru.codekittens.jim.gui.presenter.editor.LayerPanelPresenter;
import ru.codekittens.jim.gui.view.button_panel.MainButtonPanel;
import ru.codekittens.jim.gui.view.editor.EditorPanel;
import ru.codekittens.jim.model.JimFile;
import ru.codekittens.jim.scanner.JimHelper;

import spark.components.Image;

public class JimMain {

    private var window:JimWindow;

    private var editorPanel:EditorPanel;


    public function JimMain(window:JimWindow) {
        App.eventBus = new EventDispatcher();

        App.errorHandler = new ErrorHandler(window);

        App.uiModel = new UIModel();

        App.settings = new AppSettings();

        App.controller = new JimController();

        var file:JimFile = JimHelper.createEmptyJimFile();
        App.uiModel.currentFile = file;

        var buttonPanel:MainButtonPanel = new MainButtonPanel();
        var buttonPanelPresenter:BottomButtonPanelPresenter = new BottomButtonPanelPresenter(buttonPanel);



        this.window = window;

        var bitmap:Bitmap = new Resources.MAIN_BG();
        var img:Image = new Image();
        img.source = bitmap;

        window.addElement(img);

        buttonPanel.x = 0;
        buttonPanel.y = 480;
        window.addElement(buttonPanel);
        buttonPanel.getButtonBar().selectedIndex = 0;//Editor
        buttonPanel.addElement(buttonPanel.getEditorGroup());
        buttonPanel.getEditorGroup().getEditorButtonBar().selectedIndex = 0;//Level

        App.uiModel.currentEditorMode = EditorMode.LEVEL;

        editorPanel = new EditorPanel();
        var editorPresenter:EditorPresenter = new EditorPresenter(editorPanel);
        window.addElement(editorPanel);
        bind();

    }

    private function bind():void {
        App.eventBus.addEventListener(EditorSelectedEvent.EDITOR_SELECTED, function (event:EditorSelectedEvent):void {
            //TODO: Clear
            window.addElement(editorPanel);
            window.height += 50;
        });

        App.eventBus.addEventListener(ViewerSelectedEvent.VIEWER_SELECTED, function (event:ViewerSelectedEvent):void {
            window.removeElement(editorPanel);
        });

        App.eventBus.addEventListener(AppErrorEvent.ERROR, function (event:AppErrorEvent):void {
            App.errorHandler.error(event.getMessage());
        });
    }


}
}
