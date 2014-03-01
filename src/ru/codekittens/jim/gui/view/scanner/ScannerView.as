package ru.codekittens.jim.gui.view.scanner {
import spark.components.SkinnableContainer;

public class ScannerView extends SkinnableContainer {

    private var imageLoaderPanel:ImageLoaderPanel;

    public function ScannerView() {
        imageLoaderPanel = new ImageLoaderPanel();
        addElement(imageLoaderPanel);
    }

    public function getImageLoaderPanel():ImageLoaderPanel {
        return imageLoaderPanel;
    }
}
}
