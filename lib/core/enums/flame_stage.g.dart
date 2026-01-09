// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flame_stage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlameStageAdapter extends TypeAdapter<FlameStage> {
  @override
  final int typeId = 10;

  @override
  FlameStage read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FlameStage.spark;
      case 1:
        return FlameStage.match;
      case 2:
        return FlameStage.kindling;
      case 3:
        return FlameStage.smallFire;
      case 4:
        return FlameStage.campfire;
      case 5:
        return FlameStage.bonfire;
      default:
        return FlameStage.spark;
    }
  }

  @override
  void write(BinaryWriter writer, FlameStage obj) {
    switch (obj) {
      case FlameStage.spark:
        writer.writeByte(0);
        break;
      case FlameStage.match:
        writer.writeByte(1);
        break;
      case FlameStage.kindling:
        writer.writeByte(2);
        break;
      case FlameStage.smallFire:
        writer.writeByte(3);
        break;
      case FlameStage.campfire:
        writer.writeByte(4);
        break;
      case FlameStage.bonfire:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlameStageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
