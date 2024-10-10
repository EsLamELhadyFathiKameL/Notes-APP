import 'package:flutter/material.dart';
import 'package:my_notes_app/ModeLs/my_note_model.dart';
import 'package:my_notes_app/Widgets/my_edit_note_text_field.dart';

class MyEditNoteListView extends StatelessWidget {
  const MyEditNoteListView({
    super.key,
    required this.myNote,
  });
  final MyNoteModeL myNote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 32,
      ),
      child: ListView(
        children: [
          MyEditNoteTextFieLd(
            hintText: myNote.noteTitLe,
            maxLines: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          MyEditNoteTextFieLd(
            hintText: myNote.noteContent,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
