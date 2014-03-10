package ru.codekittens.jim.gui.presenter.viewer {
import ru.codekittens.jim.App;
import ru.codekittens.jim.gui.events.AppErrorEvent;
import ru.codekittens.jim.gui.events.InitViewerEvent;
import ru.codekittens.jim.gui.view.viewer.ViewerPanel;
import ru.codekittens.jim.model.JimFile;
import ru.codekittens.jim.viewer.JimViewer;

public class ViewerPresenter {

    private var viewer:JimViewer;
    private var view:ViewerPanel;
    private var file:JimFile;

    public function ViewerPresenter(view:ViewerPanel) {
        this.view = view;

        viewer = new JimViewer();
        view.getLevelViewport().addChild(viewer);

        App.eventBus.addEventListener(InitViewerEvent.TYPE, function (event:InitViewerEvent):void {
            //TODO: Or select
            var file:JimFile = App.uiModel.currentFile;
            if (file == null) {
                App.eventBus.dispatchEvent(new AppErrorEvent("TODO: Can't run viewer without file"));
            }
            viewer.view(App.uiModel.currentFile);
        });
    }

}
}
