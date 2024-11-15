import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes_app/Cubits/My_Add_New-Note_Cubit/my_add_new_note_states.dart';
import 'package:my_notes_app/ModeLs/my_note_model.dart';
import 'package:my_notes_app/my_constants.dart';

class MyAddNewNoteCubit extends Cubit<MyAddNewNoteStates> {
  MyAddNewNoteCubit() : super(MyAddNewNoteInitiaLState());
  Color? noteColor = const Color(0XFFAC3931);
  addNewNote(MyNoteModeL newNote) async {
    newNote.noteCoLor = noteColor!.value;
    emit(MyAddNewNoteLoadingState());
    try {
      var myNotesBox = Hive.box<MyNoteModeL>(kNotesBox);
      await myNotesBox.add(newNote);
      emit(MyAddNewNoteSucessState());
    } on Exception catch (e) {
      emit(
        MyAddNewNoteFaiLureState(
          e.toString(),
        ),
      );
    }
  }
}
