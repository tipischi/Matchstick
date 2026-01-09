// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChallengeAdapter extends TypeAdapter<Challenge> {
  @override
  final int typeId = 1;

  @override
  Challenge read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Challenge(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String?,
      fuelValue: fields[3] as double,
      category: fields[4] as ChallengeCategory,
      requiredStage: fields[5] as FlameStage,
      isCustom: fields[6] as bool,
      isPredefined: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Challenge obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.fuelValue)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.requiredStage)
      ..writeByte(6)
      ..write(obj.isCustom)
      ..writeByte(7)
      ..write(obj.isPredefined);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
