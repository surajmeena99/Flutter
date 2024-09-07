// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HiveUserLocation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserLocationAdapter extends TypeAdapter<HiveUserLocation> {
  @override
  final int typeId = 3;

  @override
  HiveUserLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUserLocation(
      latitude: fields[0] as String?,
      longitude: fields[1] as String?,
      userId: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUserLocation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HiveUserLocationAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
