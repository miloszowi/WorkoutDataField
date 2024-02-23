import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class WorkoutNoteDataFieldApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new WorkoutNoteDataFieldView() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as WorkoutNoteDataFieldApp {
    return Application.getApp() as WorkoutNoteDataFieldApp;
}