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
            System.println("Current index: " + i + " and currentLine: " + currentLine);
            System.println("Current lines: " + noteLines);

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
        
        System.println(noteLines);
        var myFormat = "";

        for (var i = 1; i <= noteLines.size(); i++) {
            myFormat = myFormat + "$" + i.toString() + "$\n";
        }
        
        return Lang.format(myFormat, noteLines);
    }
}