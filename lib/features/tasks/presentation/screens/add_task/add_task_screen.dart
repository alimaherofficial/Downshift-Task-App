// ignore_for_file: public_member_api_docs

import 'package:coding_challenge/core/utils/sized_x.dart';
import 'package:coding_challenge/core/widgets/custom_app_bar.dart';
import 'package:coding_challenge/core/widgets/custom_button.dart';
import 'package:coding_challenge/core/widgets/custom_padding.dart';
import 'package:coding_challenge/core/widgets/custom_textfield.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:coding_challenge/features/tasks/presentation/controllers/main_tasks/tasks_cubit.dart';
import 'package:coding_challenge/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: S.of(context).addNewTask,
        haveBackButton: true,
      ),
      body: SafeArea(
        child: CustomPadding(
          child: BlocBuilder<TasksCubit, TasksState>(
            builder: (context, state) {
              return Form(
                key: context.read<TasksCubit>().addTaskFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedX.h2,
                    CustomTextField(
                      controller: context.read<TasksCubit>().addTaskController,
                      label: S.of(context).taskName,
                      hintText: S.of(context).enterTaskName,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                            color: Theme.of(context).hintColor.withOpacity(0.5),
                          ),
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
                        context.read<TasksCubit>().addTask(
                              TaskEntity(
                                name: context
                                    .read<TasksCubit>()
                                    .addTaskController
                                    .text,
                              ),
                            );
                        context.read<TasksCubit>().addTaskController.clear();
                        Navigator.pop(context);
                      },
                      buttonText: S.of(context).add,
                      isFilled: true,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
