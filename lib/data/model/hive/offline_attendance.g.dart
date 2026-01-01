// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_attendance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfflineAttendanceAdapter extends TypeAdapter<OfflineAttendance> {
  @override
  final int typeId = 1;

  @override
  OfflineAttendance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfflineAttendance(
      qrCode: fields[0] as String,
      latitude: fields[1] as double,
      longitude: fields[2] as double,
      scanTime: fields[3] as String,
      synced: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OfflineAttendance obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.qrCode)
      ..writeByte(1)
      ..write(obj.latitude)
      ..writeByte(2)
      ..write(obj.longitude)
      ..writeByte(3)
      ..write(obj.scanTime)
      ..writeByte(4)
      ..write(obj.synced);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfflineAttendanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
