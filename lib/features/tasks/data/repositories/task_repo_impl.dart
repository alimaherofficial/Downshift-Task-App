import 'package:coding_challenge/core/errors/failures.dart';
import 'package:coding_challenge/features/tasks/data/datasource/tasks_local_datasource.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:coding_challenge/features/tasks/domain/repositories/task_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Implementation of the [TaskRepo] abstract class
@LazySingleton(as: TaskRepo)
class TaskRepoImpl implements TaskRepo {
  /// Constructor for the [TaskRepoImpl]
  TaskRepoImpl(this._tasksLocalDatasource);
  final TasksLocalDatasource _tasksLocalDatasource;

  @override
  Future<Either<Failure, Unit>> addTask(TaskEntity task) async {
    try {
      await _tasksLocalDatasource.addTask(task);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(TaskEntity task) async {
    try {
      await _tasksLocalDatasource.deleteTask(task);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
    try {
      final result = await _tasksLocalDatasource.getTasks();
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTask(TaskEntity task) async {
    try {
      await _tasksLocalDatasource.updateTask(task);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
