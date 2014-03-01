package ru.codekittens.jim {
import flash.desktop.ClipboardFormats;
import flash.events.ErrorEvent;
import flash.events.EventDispatcher;
import flash.events.NativeDragEvent;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

import mx.managers.DragManager;

import ru.codekittens.jim.gui.events.AppErrorEvent;

import ru.codekittens.jim.gui.events.ModeSelectedEvent;

import ru.codekittens.jim.gui.presenter.StartScreenPresenter;
import ru.codekittens.jim.gui.presenter.scanner.ScannerPresenter;

import ru.codekittens.jim.gui.view.StartScreen;
import ru.codekittens.jim.gui.view.scanner.ScannerView;

public class JimMain {

    private var window:JimWindow;
    private var startScreen:StartScreen;

    private var scannerView:ScannerView;

    public function JimMain(window:JimWindow) {
        App.eventBus = new EventDispatcher();

        App.errorHandler = new ErrorHandler(window);

        startScreen = new StartScreen();
        var startScreenPresenter:StartScreenPresenter = new StartScreenPresenter(startScreen);

        scannerView = new ScannerView();
        var scannerPresenter:ScannerPresenter = new ScannerPresenter(scannerView);

        this.window = window;

        window.addElement(startScreen);

        bind();

    }

    private function bind():void {
        App.eventBus.addEventListener(ModeSelectedEvent.SCANNER_SELECTED, function(event:ModeSelectedEvent):void {
            window.removeAllElements();
            window.addElement(scannerView);
        });

        App.eventBus.addEventListener(ModeSelectedEvent.VIEWER_SELECTED, function(event:ModeSelectedEvent):void {
            window.removeAllElements();
        });

        App.eventBus.addEventListener(AppErrorEvent.ERROR, function(event:AppErrorEvent):void {
           App.errorHandler.error(event.getMessage());
        });
    }



}
}
