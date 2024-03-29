// ignore_for_file: public_member_api_docs

import 'package:coding_challenge/config/routes/app_routes.dart';
import 'package:coding_challenge/core/utils/sized_x.dart';
import 'package:coding_challenge/core/widgets/custom_checkbox.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:coding_challenge/features/tasks/presentation/controllers/main_tasks/tasks_cubit.dart';
import 'package:coding_challenge/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.task,
    super.key,
  });

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            context.read<TasksCubit>().deleteTask(task);
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 10.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFFE6E6E6)),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Row(
                children: [
                  CustomCheckbox(
                    isChecked: task.isChecked,
                    onChanged: (p0) {
                      task.isChecked = !task.isChecked;
                      context.read<TasksCubit>().updateTask(task);
                    },
                  ),
                  SizedX.w3,
                  Text(
                    task.name,
                    style: task.isChecked
                        ? const TextStyle(
                            color: Color(0xFF8D8D8D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough,
                          )
                        : const TextStyle(
                            color: Color(0xFF071C55),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.editTaskRoute,
                            arguments: task,
                          );
                        },
                        child: Container(
                          width: 51,
                          height: 45,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF071C55)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              S.of(context).edit,
                              style: const TextStyle(
                                color: Color(0xFF071C55),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // delete icon button without text
                      SizedX.h0p5,
                      InkWell(
                        onTap: () {
                          context.read<TasksCubit>().deleteTask(task);
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
