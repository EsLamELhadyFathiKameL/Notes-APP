import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_notes_app/Cubits/My_Add_New-Note_Cubit/my_add_new_note_cubit.dart';
import 'package:my_notes_app/Cubits/My_Add_New-Note_Cubit/my_add_new_note_states.dart';
import 'package:my_notes_app/Cubits/My_Fetch_ALL_Notes_Cubit/my_fetch_all_notes_cubit.dart';
import 'package:my_notes_app/ListViews/my_add_note_list_view.dart';
import 'package:my_notes_app/my_constants.dart';

class MyFLoatingActionButton extends StatelessWidget {
  const MyFLoatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => MyAddNewNoteCubit(),
              child: BlocConsumer<MyAddNewNoteCubit, MyAddNewNoteStates>(
                listener: (context, state) {
                  if (state is MyAddNewNoteSucessState) {
                    BlocProvider.of<MyFetchALLNotesCubit>(context)
                        .fetchALLNotes();
                    Navigator.pop(context);
                  }
                  if (state is MyAddNewNoteFaiLureState) {
                    debugPrint("FaiLed ${state.errorMessage}");
                  }
                },
                builder: (context, state) {
                  return AbsorbPointer(
                    absorbing: state is MyAddNewNoteLoadingState ? true : false,
                    child: const MyAddNoteListView(),
                  );
                },
              ),
            );
          },
        );
      },
      backgroundColor: kPrimaryCoLor,
      shape: const CircleBorder(),
      child: Icon(
        MdiIcons.plus,
        color: Colors.black,
      ),
    );
  }
}
