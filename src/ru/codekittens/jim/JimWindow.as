package ru.codekittens.jim {
import flash.events.NativeWindowBoundsEvent;
import flash.geom.Point;

import mx.events.FlexEvent;

import ru.codekittens.jim.gui.events.AppWindowMovedEvent;
import ru.codekittens.jim.gui.view.editor.layer.ImageLoaderPanel;

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
        nativeWindow.addEventListener(NativeWindowBoundsEvent.MOVE, onAppMove);
        main = new JimMain(this);
    }

    private function onAppMove(event:NativeWindowBoundsEvent):void {
        // :3
        if (!App.settings.useMovingEffect) {
            return;
        }
        var delta:Point = new Point();
        delta.x = event.afterBounds.x - event.beforeBounds.x;
        delta.y = event.afterBounds.y - event.beforeBounds.y;
        App.eventBus.dispatchEvent(new AppWindowMovedEvent(AppWindowMovedEvent.TYPE, delta));
    }

    private function onAppResize(event:NativeWindowBoundsEvent):void {
        event.preventDefault();
    }

}
}
