// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChallengeCategoryAdapter extends TypeAdapter<ChallengeCategory> {
  @override
  final int typeId = 11;

  @override
  ChallengeCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ChallengeCategory.physical;
      case 1:
        return ChallengeCategory.mental;
      case 2:
        return ChallengeCategory.social;
      case 3:
        return ChallengeCategory.custom;
      default:
        return ChallengeCategory.physical;
    }
  }

  @override
  void write(BinaryWriter writer, ChallengeCategory obj) {
    switch (obj) {
      case ChallengeCategory.physical:
        writer.writeByte(0);
        break;
      case ChallengeCategory.mental:
        writer.writeByte(1);
        break;
      case ChallengeCategory.social:
        writer.writeByte(2);
        break;
      case ChallengeCategory.custom:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
