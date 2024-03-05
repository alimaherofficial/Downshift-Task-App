// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<TaskEntity> {
  @override
  final int typeId = 1;

  @override
  TaskEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskEntity(
      name: fields[0] as String,
      isChecked: fields[1] as bool,
      updatedAt: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isChecked)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
