import 'package:flutter/material.dart';
import 'package:my_notes_app/my_constants.dart';

class MyEditNoteTextFieLd extends StatelessWidget {
  const MyEditNoteTextFieLd({
    super.key,
    required this.hintText,
    required this.maxLines,
    this.onChanged,
  });
  final String hintText;
  final int maxLines;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      maxLines: maxLines,
      cursorColor: kPrimaryCoLor,
      style: const TextStyle(
        fontSize: 12,
        color: kPrimaryCoLor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 15,
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
