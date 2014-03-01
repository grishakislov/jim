package ru.codekittens.jim.gui.view.scanner {
import flash.display.Bitmap;

import ru.codekittens.jim.Resources;

import spark.components.Image;

import spark.components.SkinnableContainer;

public class ScannerView extends SkinnableContainer {

    private var imageLoaderPanel:ImageLoaderPanel;

    public function ScannerView() {
        var bitmap:Bitmap = new Resources.IMG_SCANNER_BG();
        var img:Image = new Image();
        img.source = bitmap;

        addElement(img);


        imageLoaderPanel = new ImageLoaderPanel();
        addElement(imageLoaderPanel);
    }

    public function getImageLoaderPanel():ImageLoaderPanel {
        return imageLoaderPanel;
    }
}
}
