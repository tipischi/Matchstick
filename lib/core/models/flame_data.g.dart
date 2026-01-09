// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flame_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlameDataAdapter extends TypeAdapter<FlameData> {
  @override
  final int typeId = 0;

  @override
  FlameData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FlameData(
      currentFuel: fields[0] as double,
      lastUpdate: fields[1] as DateTime,
      streakDays: fields[2] as int,
      stage: fields[3] as FlameStage,
      userWhy: fields[4] as String,
      isBanked: fields[5] as bool,
      lastBankedTime: fields[6] as DateTime?,
      aiMessagesUsed: fields[7] as int,
      firstLitDate: fields[8] as DateTime?,
      totalFlamesLit: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FlameData obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.currentFuel)
      ..writeByte(1)
      ..write(obj.lastUpdate)
      ..writeByte(2)
      ..write(obj.streakDays)
      ..writeByte(3)
      ..write(obj.stage)
      ..writeByte(4)
      ..write(obj.userWhy)
      ..writeByte(5)
      ..write(obj.isBanked)
      ..writeByte(6)
      ..write(obj.lastBankedTime)
      ..writeByte(7)
      ..write(obj.aiMessagesUsed)
      ..writeByte(8)
      ..write(obj.firstLitDate)
      ..writeByte(9)
      ..write(obj.totalFlamesLit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlameDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
