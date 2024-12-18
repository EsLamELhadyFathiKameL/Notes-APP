import 'package:flutter/material.dart';
import 'package:my_notes_app/Methods/my_show_snack_bar_method.dart';
import 'package:my_notes_app/my_constants.dart';

class MyAddNoteTextFieLd extends StatelessWidget {
  const MyAddNoteTextFieLd({
    super.key,
    required this.hintText,
    required this.maxLines,
    this.onSaved,
  });
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          myShowSnackBarMethod(
            context,
            "The FieLd Is Required.",
          );
          return "FieLd Is Required.";
        }
        return null;
      },
      maxLines: maxLines,
      cursorColor: kPrimaryCoLor,
      style: const TextStyle(
        fontSize: 12,
        color: kPrimaryCoLor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: kPrimaryCoLor,
          fontFamily: "Pacifico",
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: kPrimaryCoLor,
          ),
        ),
      ),
    );
  }
}
