import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_notes_app/Cubits/My_Fetch_ALL_Notes_Cubit/my_fetch_all_notes_cubit.dart';
import 'package:my_notes_app/ListViews/my_edit_note_colors_list_view.dart';
import 'package:my_notes_app/Methods/my_show_snack_bar_method.dart';
import 'package:my_notes_app/ModeLs/my_note_model.dart';
import 'package:my_notes_app/Widgets/my_edit_note_text_field.dart';

class MyEditNotePage extends StatefulWidget {
  const MyEditNotePage({
    super.key,
    required this.myNote,
  });
  final MyNoteModeL myNote;

  @override
  State<MyEditNotePage> createState() => _MyEditNotePageState();
}

class _MyEditNotePageState extends State<MyEditNotePage> {
  String? noteTitLe;
  String? noteContent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              "Edit Note",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
                color: Colors.white.withOpacity(0.1),
              ),
              child: IconButton(
                onPressed: () {
                  widget.myNote.noteTitLe =
                      noteTitLe ?? widget.myNote.noteTitLe;
                  widget.myNote.noteContent =
                      noteContent ?? widget.myNote.noteContent;
                  widget.myNote.save();
                  myShowSnackBarMethod(
                      context, "A Note Has Been Edited SuccessfuLLy.");
                  BlocProvider.of<MyFetchALLNotesCubit>(context)
                      .fetchALLNotes();
                  Navigator.pop(context);
                },
                icon: Icon(
                  MdiIcons.check,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 32,
        ),
        child: ListView(
          children: [
            MyEditNoteTextFieLd(
              onChanged: (value) {
                noteTitLe = value;
              },
              hintText: widget.myNote.noteTitLe,
              maxLines: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            MyEditNoteTextFieLd(
              onChanged: (value) {
                noteContent = value;
              },
              hintText: widget.myNote.noteContent,
              maxLines: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            MyEditNoteCoLorsListView(
              myNoteModeL: widget.myNote,
            ),
          ],
        ),
      ),
    );
  }
}
