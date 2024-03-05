// ignore_for_file: public_member_api_docs

import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/update_task_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit(
    this._updateTaskUseCase,
  ) : super(EditTaskInitial());

  TextEditingController editTaskController = TextEditingController();

  GlobalKey<FormState> editTaskFormKey = GlobalKey();

  final UpdateTaskUseCase _updateTaskUseCase;

  Future<void> updateTask(TaskEntity task) async {
    if (editTaskFormKey.currentState!.validate()) {
      final result = await _updateTaskUseCase.call(UpdateTaskParams(task));
      result.fold(
        (failure) => emit(EditTaskError(failure.toString())),
        (r) => emit(EditTaskLoaded()),
      );
    }
  }
}
