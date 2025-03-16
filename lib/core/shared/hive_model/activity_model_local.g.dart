// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityModelAdapter extends TypeAdapter<ActivityModel> {
  @override
  final int typeId = 0;

  @override
  ActivityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivityModel(
      activity: fields[0] as String,
      accessibility: fields[1] as double,
      type: fields[2] as String,
      participants: fields[3] as int,
      price: fields[4] as double,
      link: fields[5] as String,
      key: fields[6] as String,
      createdAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ActivityModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.activity)
      ..writeByte(1)
      ..write(obj.accessibility)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.participants)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.link)
      ..writeByte(6)
      ..write(obj.key)
      ..writeByte(7)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
