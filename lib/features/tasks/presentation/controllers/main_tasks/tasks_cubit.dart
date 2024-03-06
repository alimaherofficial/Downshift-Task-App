// ignore_for_file: public_member_api_docs

import 'package:coding_challenge/core/base_usecase.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/add_task_usecase.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/update_task_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(
    this._getTasksUseCase,
    this._addTaskUseCase,
    this._updateTaskUseCase,
    this._deleteTaskUseCase,
  ) : super(TasksInitial());

  TextEditingController addTaskController = TextEditingController();

  GlobalKey<FormState> addTaskFormKey = GlobalKey();

  final GetTasksUseCase _getTasksUseCase;
  final AddTaskUseCase _addTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  final List<TaskEntity> tasks = [];

  Future<void> getTasks() async {
    emit(TasksLoading());
    final result = await _getTasksUseCase.call(NoParameters());
    result.fold(
      (failure) => emit(TasksError(failure.toString())),
      (result) {
        tasks
          ..clear()
          ..addAll(result);
        emit(TasksLoaded());
      },
    );
  }

  Future<void> addTask(TaskEntity task) async {
    if (addTaskFormKey.currentState?.validate() ?? true) {
      // ?? true for test purpose
      final result = await _addTaskUseCase.call(AddTaskPrams(task));
      result.fold(
        (failure) => emit(TasksError(failure.toString())),
        (r) {
          addTaskController.clear();
          tasks.add(task);
          emit(TasksLoaded());
        },
      );
    }
  }

  Future<void> updateTask(TaskEntity task) async {
    final result = await _updateTaskUseCase.call(UpdateTaskParams(task));
    result.fold(
      (failure) => emit(TasksError(failure.toString())),
      (r) {
        tasks.firstWhere((element) => element.name == task.name)
          ..isChecked = task.isChecked
          ..name = task.name
          ..updatedAt = task.updatedAt;
        emit(TasksLoaded());
      },
    );
  }

  Future<void> deleteTask(TaskEntity task) async {
    final result = await _deleteTaskUseCase.call(DeleteTaskParams(task));
    result.fold(
      (failure) => emit(TasksError(failure.toString())),
      (r) {
        tasks.removeWhere((element) => element.name == task.name);
        emit(TasksLoaded());
      },
    );
  }
}
