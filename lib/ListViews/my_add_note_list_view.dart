import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_notes_app/Cubits/My_Add_New-Note_Cubit/my_add_new_note_cubit.dart';
import 'package:my_notes_app/Cubits/My_Add_New-Note_Cubit/my_add_new_note_states.dart';
import 'package:my_notes_app/ListViews/my_colors_list_view.dart';
import 'package:my_notes_app/Methods/my_show_snack_bar_method.dart';
import 'package:my_notes_app/ModeLs/my_note_model.dart';
import 'package:my_notes_app/Widgets/my_add_note_custom_button.dart';
import 'package:my_notes_app/Widgets/my_add_note_text_field.dart';

class MyAddNoteListView extends StatefulWidget {
  const MyAddNoteListView({super.key});

  @override
  State<MyAddNoteListView> createState() => _MyAddNoteListViewState();
}

class _MyAddNoteListViewState extends State<MyAddNoteListView> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMod = AutovalidateMode.disabled;
  String? noteTitLe, noteContent;
  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: keyboardHeight,
      ),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMod,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 12,
              ),
              child: MyAddNoteTextFieLd(
                onSaved: (value) {
                  noteTitLe = value;
                },
                hintText: "TitLe",
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              child: MyAddNoteTextFieLd(
                onSaved: (value) {
                  noteContent = value;
                },
                hintText: "Content",
                maxLines: 5,
              ),
            ),
            const MyCoLorsListView(),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<MyAddNewNoteCubit, MyAddNewNoteStates>(
              builder: (context, state) {
                return MyAddNoteCustomButton(
                  isLoading: state is MyAddNewNoteLoadingState ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      myShowSnackBarMethod(
                          context, "A New Note Has Been Added SuccessfuLLy.");
                      var currentDateTime = DateTime.now();
                      var formattedCurrentDateTime =
                          DateFormat.yMMMEd().format(currentDateTime);
                      MyNoteModeL newNote = MyNoteModeL(
                        noteTitLe: noteTitLe!,
                        noteContent: noteContent!,
                        noteDateTime: formattedCurrentDateTime,
                        noteCoLor: Colors.blue.value,
                      );
                      BlocProvider.of<MyAddNewNoteCubit>(context)
                          .addNewNote(newNote);
                    } else {
                      AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
