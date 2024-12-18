// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyNoteModeLAdapter extends TypeAdapter<MyNoteModeL> {
  @override
  final int typeId = 0;

  @override
  MyNoteModeL read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyNoteModeL(
      noteTitLe: fields[0] as String,
      noteContent: fields[1] as String,
      noteDateTime: fields[2] as String,
      noteCoLor: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MyNoteModeL obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.noteTitLe)
      ..writeByte(1)
      ..write(obj.noteContent)
      ..writeByte(2)
      ..write(obj.noteDateTime)
      ..writeByte(3)
      ..write(obj.noteCoLor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyNoteModeLAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
