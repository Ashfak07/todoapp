// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_list _model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyListModelAdapter extends TypeAdapter<MyListModel> {
  @override
  final int typeId = 1;

  @override
  MyListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyListModel(
      title: fields[0] as String,
      descr: fields[1] as String,
      containerColor: fields[2] as String,
      time: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyListModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.descr)
      ..writeByte(2)
      ..write(obj.containerColor)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
