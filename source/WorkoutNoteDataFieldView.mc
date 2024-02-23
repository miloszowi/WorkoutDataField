import Toybox.Activity;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class WorkoutNoteDataFieldView extends WatchUi.DataField {

    hidden var _textArea;

    function initialize() {
        DataField.initialize();
    }
    
    function onLayout(dc) {
        var workoutNoteProvider = new WorkoutNoteProvider();
        System.println(dc.getTextDimensions(workoutNoteProvider.provide(), Graphics.FONT_XTINY));

        _textArea = new WatchUi.TextArea({
            :text=> workoutNoteProvider.provide(),
            :color=>Graphics.COLOR_WHITE,
            :font=>[Graphics.FONT_XTINY],
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_CENTER,
            :width=>dc.getWidth()* 2/3,
            :height=>dc.getHeight() * 7.5/10,
            :justification=>Graphics.TEXT_JUSTIFY_LEFT
        });
    }

    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        _textArea.draw(dc);
    }



}
