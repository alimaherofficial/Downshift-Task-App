// ignore_for_file: public_member_api_docs

import 'package:coding_challenge/core/utils/sized_x.dart';
import 'package:coding_challenge/core/widgets/custom_app_bar.dart';
import 'package:coding_challenge/core/widgets/custom_button.dart';
import 'package:coding_challenge/core/widgets/custom_padding.dart';
import 'package:coding_challenge/core/widgets/custom_textfield.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/update_task_usecase.dart';
import 'package:coding_challenge/features/tasks/presentation/controllers/edit_task/edit_task_cubit.dart';
import 'package:coding_challenge/features/tasks/presentation/controllers/main_tasks/tasks_cubit.dart';
import 'package:coding_challenge/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({required this.task, super.key});

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditTaskCubit(
        context.read<UpdateTaskUseCase>(),
      ),
      child: BlocConsumer<EditTaskCubit, EditTaskState>(
        listener: (context, state) async {
          if (state is EditTaskLoaded) {
            await context.read<TasksCubit>().updateTask(task);
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          context.read<EditTaskCubit>().editTaskController.text = task.name;
          return Scaffold(
            appBar: customAppBar(
              context: context,
              title: S.of(context).editTask,
              haveBackButton: true,
            ),
            body: SafeArea(
              child: CustomPadding(
                child: Form(
                  key: context.read<EditTaskCubit>().editTaskFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedX.h2,
                      CustomTextField(
                        controller:
                            context.read<EditTaskCubit>().editTaskController,
                        label: S.of(context).taskName,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        useBorder: true,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return S.of(context).pleaseEnterTaskName;
                          }
                          return null;
                        },
                      ),
                      const Spacer(),
                      CustomButton(
                        onPressed: () {
                          context.read<EditTaskCubit>().updateTask(
                                task,
                              );
                        },
                        buttonText: S.of(context).done,
                        isFilled: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
