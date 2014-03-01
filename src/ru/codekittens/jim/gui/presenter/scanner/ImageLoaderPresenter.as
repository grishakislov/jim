package ru.codekittens.jim.gui.presenter.scanner {
import flash.desktop.ClipboardFormats;
import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.MouseEvent;
import flash.events.NativeDragEvent;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.net.FileReference;
import flash.utils.ByteArray;

import mx.managers.DragManager;

import ru.codekittens.jim.App;
import ru.codekittens.jim.gui.events.AppErrorEvent;
import ru.codekittens.jim.gui.events.ImageLoadedEvent;

import ru.codekittens.jim.gui.view.scanner.ImageLoaderPanel;

public class ImageLoaderPresenter {

    private var view:ImageLoaderPanel;

    public function ImageLoaderPresenter(view:ImageLoaderPanel) {

        this.view = view;

        view.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, function (event:NativeDragEvent):void {
            if (event.clipboard.hasFormat(ClipboardFormats.FILE_LIST_FORMAT)) {
                var files:Array = event.clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
                if (files.length == 1) {
                    //TODO: Check format;
                    DragManager.acceptDragDrop(view);
                }
            }
        });

        view.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP, function (event:NativeDragEvent):void {
            var arr:Array = event.clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;

            var f:File = File(arr[0]);
            var fs:FileStream = new FileStream();

            fs.open(f, FileMode.READ);
            var bytes:ByteArray = new ByteArray
            fs.readBytes(bytes);
            fs.close();

            var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadedHandler);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            loader.loadBytes(bytes);
        });

        view.getBtnLoad().addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
            var fileReference:FileReference = new FileReference();

            fileReference.addEventListener(Event.SELECT, function (event:Event):void {
                fileReference.load();
            });

            fileReference.addEventListener(Event.COMPLETE, function (event:Event):void {
                var loader:Loader = new Loader();
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadedHandler);
                loader.loadBytes((event.target as FileReference).data);

            });

            fileReference.browse();
        });

    }

    private function ioErrorHandler(event:IOErrorEvent):void {
        App.eventBus.dispatchEvent(new AppErrorEvent("Unknown type"))
    }

    private function imageLoadedHandler(event:Event):void {
        trace("File loaded");
        var bitmap:Bitmap = event.target.content as Bitmap;

        if (bitmap == null) {
            App.eventBus.dispatchEvent(new AppErrorEvent("Invalid type"))
        } else {
            trace("Image loaded successfully")
            App.eventBus.dispatchEvent(new ImageLoadedEvent(bitmap));
        }
    }

}
}
