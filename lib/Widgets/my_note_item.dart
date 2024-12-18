import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_notes_app/Cubits/My_Fetch_ALL_Notes_Cubit/my_fetch_all_notes_cubit.dart';
import 'package:my_notes_app/Methods/my_show_snack_bar_method.dart';
import 'package:my_notes_app/ModeLs/my_note_model.dart';
import 'package:my_notes_app/Screens/my_edit_note_page.dart';

class MyNoteItem extends StatelessWidget {
  const MyNoteItem({
    super.key,
    required this.myNote,
  });
  final MyNoteModeL myNote;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MyEditNotePage(myNote: myNote);
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
          color: Color(myNote.noteCoLor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: Text(
                    myNote.noteTitLe,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                subtitle: Text(
                  myNote.noteContent,
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    myNote.delete();
                    myShowSnackBarMethod(
                        context, "A Note Has Been DeLeted SuccessfuLLy.");
                    BlocProvider.of<MyFetchALLNotesCubit>(context)
                        .fetchALLNotes();
                  },
                  icon: Icon(
                    MdiIcons.delete,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                bottom: 25,
              ),
              child: Text(
                myNote.noteDateTime.toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
