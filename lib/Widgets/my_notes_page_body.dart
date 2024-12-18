import 'package:flutter/widgets.dart';
import 'package:my_notes_app/ListViews/my_notes_list_view.dart';

class MyNotesPageBody extends StatelessWidget {
  const MyNotesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 32,
      ),
      child: MyNotesListView(),
    );
  }
}
