import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes_app/Cubits/My_Fetch_ALL_Notes_Cubit/my_fetch_all_notes_cubit.dart';
import 'package:my_notes_app/ModeLs/my_note_model.dart';
import 'package:my_notes_app/Screens/my_notes_page.dart';
import 'package:my_notes_app/Screens/my_splash_page.dart';
import 'package:my_notes_app/my_constants.dart';
import 'package:my_notes_app/my_simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MyNoteModeLAdapter());
  await Hive.openBox<MyNoteModeL>(kNotesBox);
  Bloc.observer = MySimpLeBLocObserver();
  runApp(const MyNotesAPP());
}

class MyNotesAPP extends StatelessWidget {
  const MyNotesAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyFetchALLNotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routes: {
          kNotesPage: (context) => const MyNotesPage(),
          kSpLashPage: (context) => const MySpLashPage(),
        },
        initialRoute: kSpLashPage,
      ),
    );
  }
}
