package ru.codekittens.jim.scanner {

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.text.TextField;

[SWF(frameRate="60", width="800", height="600")]
public class Main extends Sprite {

    private static const TILE_SIZE:uint = 16;

    public function Main() {
        var map:Bitmap = new Resources.MAP4();
        var bg:Bitmap = new Resources.BG();

        trace("Start");

        var scanner:Scanner = new Scanner(TILE_SIZE);
        scanner.scan(map);
        addChild(new Bitmap(scanner.getModel().tiles));
    }


}
}
