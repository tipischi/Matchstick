// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_log.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompletionLogAdapter extends TypeAdapter<CompletionLog> {
  @override
  final int typeId = 2;

  @override
  CompletionLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompletionLog(
      challengeId: fields[0] as String,
      completedAt: fields[1] as DateTime,
      fuelAdded: fields[2] as double,
      note: fields[3] as String?,
      challengeTitle: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompletionLog obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.challengeId)
      ..writeByte(1)
      ..write(obj.completedAt)
      ..writeByte(2)
      ..write(obj.fuelAdded)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.challengeTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompletionLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
