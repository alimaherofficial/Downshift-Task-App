// ignore_for_file: public_member_api_docs

part of 'tasks_cubit.dart';

abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoaded extends TasksState {}

class TasksLoading extends TasksState {}

class TasksError extends TasksState {
  TasksError(this.message);
  final String message;
}
