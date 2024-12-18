import 'package:hive/hive.dart';
part 'my_note_model.g.dart';

@HiveType(typeId: 0)
class MyNoteModeL extends HiveObject {
  @HiveField(0)
  String noteTitLe;
  @HiveField(1)
  String noteContent;
  @HiveField(2)
  final String noteDateTime;
  @HiveField(3)
  int noteCoLor;

  MyNoteModeL({
    required this.noteTitLe,
    required this.noteContent,
    required this.noteDateTime,
    required this.noteCoLor,
  });
}
