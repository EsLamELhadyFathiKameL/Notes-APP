import 'package:flutter/material.dart';
import 'package:my_notes_app/my_constants.dart';

class MyAddNoteCustomButton extends StatelessWidget {
  const MyAddNoteCustomButton({
    super.key,
    this.onTap,
    this.isLoading = false,
  });
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          color: kPrimaryCoLor,
        ),
        alignment: Alignment.center,
        child: isLoading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : const Text(
                "Add",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
