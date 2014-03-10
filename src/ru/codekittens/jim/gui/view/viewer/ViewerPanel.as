package ru.codekittens.jim.gui.view.viewer {
import mx.core.UIComponent;

import spark.core.SpriteVisualElement;

public class ViewerPanel extends UIComponent {

    private var levelViewport:SpriteVisualElement;

    public function ViewerPanel() {
        levelViewport = new SpriteVisualElement();
        addChild(levelViewport);
    }

    public function getLevelViewport():SpriteVisualElement {
        return levelViewport;
    }
}
}
