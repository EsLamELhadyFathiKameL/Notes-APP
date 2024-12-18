import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes_app/Cubits/My_Fetch_ALL_Notes_Cubit/my_fetch_all_notes_states.dart';
import 'package:my_notes_app/ModeLs/my_note_model.dart';
import 'package:my_notes_app/my_constants.dart';

class MyFetchALLNotesCubit extends Cubit<MyFetchALLNotesStates> {
  MyFetchALLNotesCubit() : super(MyFetchALLNotesInitiaLState());

  List<MyNoteModeL> fetchALLNotes() {
    var myNotesBox = Hive.box<MyNoteModeL>(kNotesBox);
    List<MyNoteModeL> myNotesList = myNotesBox.values.toList();
    emit(MyFetchALLNoteseSucessState());
    return myNotesList;
  }
}
