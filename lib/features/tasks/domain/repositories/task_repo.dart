import 'package:coding_challenge/core/errors/failures.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:dartz/dartz.dart';

/// Abstract class for the repository of the tasks
abstract class TaskRepo {
  /// Add a task to the local database using the [TaskEntity] model
  Future<Either<Failure, Unit>> addTask(TaskEntity task);

  /// Delete a task from the local database using the [TaskEntity] model
  Future<Either<Failure, Unit>> deleteTask(TaskEntity task);

  /// Update a task from the local database using the [TaskEntity] model
  Future<Either<Failure, Unit>> updateTask(TaskEntity task);

  /// Get all the tasks from the local database
  Future<Either<Failure, List<TaskEntity>>> getTasks();
}
