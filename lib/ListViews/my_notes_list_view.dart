import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/Cubits/My_Fetch_ALL_Notes_Cubit/my_fetch_all_notes_cubit.dart';
import 'package:my_notes_app/Cubits/My_Fetch_ALL_Notes_Cubit/my_fetch_all_notes_states.dart';
import 'package:my_notes_app/ModeLs/my_note_model.dart';
import 'package:my_notes_app/Widgets/my_note_item.dart';

class MyNotesListView extends StatelessWidget {
  const MyNotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFetchALLNotesCubit, MyFetchALLNotesStates>(
      builder: (context, state) {
        List<MyNoteModeL> myNotes =
            BlocProvider.of<MyFetchALLNotesCubit>(context).fetchALLNotes();
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: myNotes.length,
          itemBuilder: (context, index) {
            return MyNoteItem(
              myNote: myNotes[index],
            );
          },
        );
      },
    );
  }
}
