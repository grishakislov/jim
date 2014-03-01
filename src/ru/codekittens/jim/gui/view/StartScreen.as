package ru.codekittens.jim.gui.view {
import flash.display.Bitmap;

import org.osmf.layout.HorizontalAlign;

import ru.codekittens.jim.Resources;

import spark.components.BorderContainer;

import spark.components.Button;
import spark.components.HGroup;
import spark.components.Image;
import spark.components.SkinnableContainer;
import spark.layouts.HorizontalLayout;

public class StartScreen extends HGroup {

    private var _btnScanner:Button;
    private var _btnViewer:Button;

    public function StartScreen() {
        var bitmap:Bitmap = new Resources.IMG_START();

        var mainContainer:SkinnableContainer = new SkinnableContainer();
        var imageContainer:SkinnableContainer = new SkinnableContainer();
        var buttonContainer:SkinnableContainer = new SkinnableContainer();

        var centerLayout:HorizontalLayout = new HorizontalLayout();
        centerLayout.horizontalAlign = HorizontalAlign.CENTER;
        centerLayout.gap = 50;
        buttonContainer.layout = centerLayout;
        buttonContainer.width = bitmap.width;


        var img:Image = new Image();
        img.source = bitmap;

        _btnScanner = new Button();
        _btnScanner.label = "Scanner";
        _btnViewer = new Button();
        _btnViewer.label = "Viewer";

        imageContainer.addElement(img);
        buttonContainer.addElement(_btnScanner);
        buttonContainer.addElement(_btnViewer);

        buttonContainer.x = 0;
        buttonContainer.y = 220;

        mainContainer.addElement(imageContainer);
        mainContainer.addElement(buttonContainer);

        addElement(mainContainer);

    }

    public function get btnScanner():Button {
        return _btnScanner;
    }

    public function get btnViewer():Button {
        return _btnViewer;
    }
}
}
