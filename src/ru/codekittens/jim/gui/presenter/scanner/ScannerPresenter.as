package ru.codekittens.jim.gui.presenter.scanner {
import ru.codekittens.jim.gui.view.scanner.ScannerView;

public class ScannerPresenter {

    private var view:ScannerView;

    public function ScannerPresenter(view:ScannerView) {
        this.view = view;

        var imageLoaderPresenter:ImageLoaderPresenter = new ImageLoaderPresenter(view.getImageLoaderPanel());
    }

}
}
