package ru.codekittens.jim {
import flash.display.Bitmap;
import flash.events.EventDispatcher;

import ru.codekittens.jim.gui.events.AppErrorEvent;
import ru.codekittens.jim.gui.events.InitViewerEvent;
import ru.codekittens.jim.gui.events.UIModeChangedEvent;
import ru.codekittens.jim.gui.presenter.button_panel.BottomButtonPanelPresenter;
import ru.codekittens.jim.gui.presenter.button_panel.EditorMode;
import ru.codekittens.jim.gui.presenter.button_panel.UIMode;
import ru.codekittens.jim.gui.presenter.editor.EditorPresenter;
import ru.codekittens.jim.gui.presenter.viewer.ViewerPresenter;
import ru.codekittens.jim.gui.view.button_panel.MainButtonPanel;
import ru.codekittens.jim.gui.view.editor.EditorPanel;
import ru.codekittens.jim.gui.view.viewer.ViewerPanel;
import ru.codekittens.jim.model.JimFile;
import ru.codekittens.jim.scanner.JimHelper;

import spark.components.Group;
import spark.components.Image;

public class JimMain {

    private var window:JimWindow;
    private var mainContainer:Group;

    private var editorPanel:EditorPanel;
    private var viewerPanel:ViewerPanel;


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

        mainContainer = new Group();
        window.addElement(mainContainer);

        var bitmap:Bitmap = new Resources.MAIN_BG();
        var img:Image = new Image();
        img.source = bitmap;

        mainContainer.addElement(img);

        buttonPanel.x = 0;
        buttonPanel.y = 480;
        mainContainer.addElement(buttonPanel);
        buttonPanel.getButtonBar().selectedIndex = 0;//Editor
        buttonPanel.addElement(buttonPanel.getEditorGroup());
        buttonPanel.getEditorGroup().getEditorButtonBar().selectedIndex = 0;//Level

        App.uiModel.currentEditorMode = EditorMode.LEVEL;

        editorPanel = new EditorPanel();
        var editorPresenter:EditorPresenter = new EditorPresenter(editorPanel);
        viewerPanel = new ViewerPanel();

        var viewerPresenter:ViewerPresenter = new ViewerPresenter(viewerPanel);
        mainContainer.addElement(editorPanel);
        bind();

    }

    private function bind():void {

        App.eventBus.addEventListener(UIModeChangedEvent.TYPE, function (event:UIModeChangedEvent):void {

            switch (event.getNewMode()) {

                case UIMode.EDITOR:
                    if (mainContainer.containsElement(viewerPanel)) {
                        mainContainer.removeElement(viewerPanel);
                    }
                    mainContainer.addElement(editorPanel);
                    break;
                case UIMode.VIEWER:
                    if (mainContainer.containsElement(editorPanel)) {
                        mainContainer.removeElement(editorPanel);
                    }

                    mainContainer.addElement(viewerPanel);
                    App.eventBus.dispatchEvent(new InitViewerEvent(InitViewerEvent.TYPE));
                    break;
            }
            {
            }
        });

        App.eventBus.addEventListener(AppErrorEvent.TYPE, function (event:AppErrorEvent):void {
            App.errorHandler.error(event.getMessage());
        });
    }


}
}
