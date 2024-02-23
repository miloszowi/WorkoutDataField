import Toybox.Lang;

class WorkoutNoteProvider {

    hidden function getNewLineIndicator() as String {
        return Application.Properties.getValue("newLineIndicator");
    }

    hidden function getWorkoutNote() as String {
        return Application.Properties.getValue("workoutNote");
    }

    function provide() as String {
        var splitedNote = getWorkoutNote().toCharArray();
        var noteLines = [];
        var currentLine = "";

        for (var i = 1; i < splitedNote.size(); i++) {
            if (splitedNote[i].toString().equals(getNewLineIndicator())) {
                noteLines.add(currentLine);
                currentLine = "";

                continue;
            }

            currentLine = currentLine + splitedNote[i].toString();

            if (i == splitedNote.size() - 1) {
                noteLines.add(currentLine);
            }
        }
        
        var myFormat = "";

        for (var i = 1; i <= noteLines.size(); i++) {
            myFormat = myFormat + "$" + i.toString() + "$\n";
        }
        
        return Lang.format(myFormat, noteLines);
    }
}