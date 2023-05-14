// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelves_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShelvesVOAdapter extends TypeAdapter<ShelvesVO> {
  @override
  final int typeId = 2;

  @override
  ShelvesVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShelvesVO(
      fields[0] as String?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<BookVO>(),
      fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ShelvesVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.shelfId)
      ..writeByte(1)
      ..write(obj.shelfName)
      ..writeByte(2)
      ..write(obj.booksList)
      ..writeByte(3)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelvesVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
