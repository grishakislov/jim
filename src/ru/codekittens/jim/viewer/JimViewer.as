package ru.codekittens.jim.viewer {
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.errors.IllegalOperationError;
import flash.events.Event;
import flash.events.KeyboardEvent;

import ru.codekittens.jim.model.JimFile;
import ru.codekittens.jim.model.LayerDefinition;

public class JimViewer extends Sprite {

    private static const SPEED:uint = 2;

    private var model:JimFile;
    private var layers:Vector.<ViewerLayer>;

    private var keymap:ViewerKeymap;

    public function JimViewer() {
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        addEventListener(Event.ENTER_FRAME, onEnterFrame);

        scaleX = scaleY = 2.0;
        keymap = new ViewerKeymap();
    }

    public function view(jim:JimFile):void {
        if (stage == null) {
            throw new IllegalOperationError("Jim Viewer must be added to stage")
        }
        model = jim;
        layers = new Vector.<ViewerLayer>();
        reset();
        loadModel();
    }

    private function loadModel():void {
        var currentDef:LayerDefinition;
        var bitmap:Bitmap;

        var frontLayerWidth:uint;
        var frontLayerHeight:uint;

        for (var i:int = 0; i < model.layers.length; i++) {
            currentDef = model.layers[i].definition;
            bitmap = new Bitmap(MapHelper.loadLayer(model.layers[i]));

            if (i == 0) {
                frontLayerWidth = bitmap.width;
                frontLayerHeight = bitmap.height;
            }

            var layer:ViewerLayer = new ViewerLayer();
            layer.bitmap = bitmap;
            layer.relativeWidth = bitmap.width / frontLayerWidth;
            layer.relativeHeight = bitmap.height / frontLayerHeight;

            //TODO: Apply offset
            layer.x = layer.y = 0;
            layer.updatePosition();
            layers.push(layer);
            addChild(bitmap);
        }
    }

    private function reset():void {
        removeChildren();
        if (layers != null) {
            flushLayers();
        }
    }

    private function onKeyDown(event:KeyboardEvent):void {
        keymap.keyDown(event.keyCode);
    }

    private function onKeyUp(event:KeyboardEvent):void {
        keymap.keyUp(event.keyCode);
    }

    private function updatePosition():void {

        for (var i:int = 0; i < keymap.getDirections().length; i++) {
            processDirection(keymap.getDirections()[i]);
        }
    }

    private function processDirection(currentDirection:ViewerDirection):void {
        var deltaX:int;
        var deltaY:int;
        switch (currentDirection) {
            case ViewerDirection.UP:
                deltaX = 0;
                deltaY = SPEED;
                break;
            case ViewerDirection.RIGHT:
                deltaX = -SPEED;
                deltaY = 0;
                break;
            case ViewerDirection.DOWN:
                deltaX = 0;
                deltaY = -SPEED;
                break;
            case ViewerDirection.LEFT:
                deltaX = SPEED;
                deltaY = 0;
                break;
        }

        var currentSprite:ViewerLayer;

        for (var i:int = 0; i < model.layers.length; i++) {
            currentSprite = layers[i];

            currentSprite.x += deltaX * currentSprite.relativeWidth;
            currentSprite.y += deltaY * currentSprite.relativeHeight;
            currentSprite.updatePosition();
        }
    }

    private function flushLayers():void {
        for (var i:int = 0; i < layers.length; i++) {
            layers[i].bitmap.bitmapData.dispose();
        }
        layers = new Vector.<ViewerLayer>();
    }

    private function onEnterFrame(event:Event):void {
        updatePosition();
    }

    private function onAddedToStage(event:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
    }

}
}
