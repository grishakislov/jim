package ru.codekittens.jim {
import flash.events.NativeWindowBoundsEvent;

import mx.events.FlexEvent;

import ru.codekittens.jim.gui.view.scanner.ImageLoaderPanel;

import spark.components.WindowedApplication;

public class JimWindow extends WindowedApplication {

    private var main:JimMain;

    private var smbImageLoader:ImageLoaderPanel;

    public function JimWindow() {
        this.addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
    }

    private function onCreationComplete(event:FlexEvent):void {
        this.removeEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
        nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZING, onAppResize);
        main = new JimMain(this);
    }

    private function onAppResize(event:NativeWindowBoundsEvent):void {
        event.preventDefault();
    }

}
}
