class MyAddNewNoteStates {}

class MyAddNewNoteInitiaLState extends MyAddNewNoteStates {}

class MyAddNewNoteLoadingState extends MyAddNewNoteStates {}

class MyAddNewNoteSucessState extends MyAddNewNoteStates {}

class MyAddNewNoteFaiLureState extends MyAddNewNoteStates {
  final String errorMessage;

  MyAddNewNoteFaiLureState(this.errorMessage);
}
