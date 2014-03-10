package ru.codekittens.jim.ui.view.viewer {
import flash.display.Bitmap;
import flash.display.BitmapData;

import mx.core.UIComponent;

import spark.core.SpriteVisualElement;

public class ViewerPanel extends UIComponent {

    private var levelViewport:SpriteVisualElement;

    public function ViewerPanel() {
        levelViewport = new SpriteVisualElement();
        addChild(levelViewport);
        levelViewport.mask = new Bitmap(new BitmapData(640,480,false, 0));
        width = 640;
        height = 480;
    }

    public function getLevelViewport():SpriteVisualElement {
        return levelViewport;
    }
}
}
