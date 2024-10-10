import 'package:flutter/widgets.dart';
import 'package:my_notes_app/ModeLs/my_note_model.dart';
import 'package:my_notes_app/Widgets/my_color_item.dart';
import 'package:my_notes_app/my_constants.dart';

class MyEditNoteCoLorsListView extends StatefulWidget {
  const MyEditNoteCoLorsListView({
    super.key,
    required this.myNoteModeL,
  });
  final MyNoteModeL myNoteModeL;
  @override
  State<MyEditNoteCoLorsListView> createState() => _MyCoLorsListViewState();
}

class _MyCoLorsListViewState extends State<MyEditNoteCoLorsListView> {
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = kNotesCoLors.indexOf(Color(widget.myNoteModeL.noteCoLor));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: kNotesCoLors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.myNoteModeL.noteCoLor = kNotesCoLors[index].value;
              setState(() {});
            },
            child: MyCoLorItem(
              isActive: currentIndex == index,
              color: kNotesCoLors[index],
            ),
          );
        },
      ),
    );
  }
}
