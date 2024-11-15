import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/Cubits/My_Add_New-Note_Cubit/my_add_new_note_cubit.dart';
import 'package:my_notes_app/Widgets/my_color_item.dart';
import 'package:my_notes_app/my_constants.dart';

class MyCoLorsListView extends StatefulWidget {
  const MyCoLorsListView({super.key});

  @override
  State<MyCoLorsListView> createState() => _MyCoLorsListViewState();
}

class _MyCoLorsListViewState extends State<MyCoLorsListView> {
  int currentIndex = 0;

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
              BlocProvider.of<MyAddNewNoteCubit>(context).noteColor =
                  kNotesCoLors[index];
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
