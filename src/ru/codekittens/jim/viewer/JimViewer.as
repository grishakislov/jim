package ru.codekittens.jim.viewer {
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.errors.IllegalOperationError;
import flash.events.Event;
import flash.events.KeyboardEvent;

import jim_model.JimFile;
import jim_model.LayerDefinition;

public class JimViewer extends Sprite {

    private var model:JimFile;
    private var layers:Vector.<Bitmap>;

    public function JimViewer() {
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        scaleX = scaleY = 2.0;
    }

    public function view(jim:JimFile):void {
        if (stage == null) {
            throw new IllegalOperationError("Jim Viewer must be added to stage")
        }
        model = jim;
        layers = new Vector.<Bitmap>();
        reset();
        loadModel();
    }

    private function loadModel():void {
        var currentDef:LayerDefinition;
        var bitmap:Bitmap;
        for (var i:int = 0; i < model.head.numLayers; i++) {
            currentDef = model.head.layers[i];
            bitmap = new Bitmap(MapHelper.loadLayer(model.layers[i], model.head.layers[i]));
            layers.push(bitmap);
            addChild(bitmap);
        }
    }

    private function reset():void {
        removeChildren();
        if (layers != null) {
            flushLayers();
        }
        if (!hasEventListener(Event.ENTER_FRAME)) {
            addEventListener(Event.ENTER_FRAME, onEnterFrame);
        }
        if (!hasEventListener(KeyboardEvent.KEY_DOWN)) {
            addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        }
        if (!hasEventListener(KeyboardEvent.KEY_UP)) {
            addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        }
    }

    private function onKeyDown(event:KeyboardEvent):void {

    }

    private function onKeyUp(event:KeyboardEvent):void {

    }

    private function flushLayers():void {
        for (var i:int = 0; i < layers.length; i++) {
            layers[i].bitmapData.dispose();
        }
        layers = new Vector.<Bitmap>();
    }

    private function onEnterFrame(event:Event):void {

    }

    private function onAddedToStage(event:Event):void {

    }


}
}
