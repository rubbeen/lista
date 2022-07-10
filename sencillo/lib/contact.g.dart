// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContacAdapter extends TypeAdapter<Contac> {
  @override
  final int typeId = 0;

  @override
  Contac read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contac(
      name: fields[0] as String,
      number: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Contac obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContacAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
