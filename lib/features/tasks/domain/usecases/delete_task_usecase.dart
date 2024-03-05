import 'package:coding_challenge/core/base_usecase.dart';
import 'package:coding_challenge/core/errors/failures.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:coding_challenge/features/tasks/domain/repositories/task_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// The use case for deleting a task
/// this class will be used to delete a task from the local database
/// using the [TaskEntity] model
/// this class extends the [BaseUseCase] class
/// and implements the call method
/// the call method will take [DeleteTaskParams] as a parameter
@lazySingleton
class DeleteTaskUseCase extends BaseUseCase<Failure, Unit, DeleteTaskParams> {
  /// Constructor for the [DeleteTaskUseCase]
  DeleteTaskUseCase(this._taskRepo);

  final TaskRepo _taskRepo;

  @override
  Future<Either<Failure, Unit>> call(DeleteTaskParams parameters) async {
    final result = await _taskRepo.deleteTask(parameters.task);
    return result;
  }
}

/// The parameters for the [DeleteTaskUseCase]
class DeleteTaskParams {
  /// Delete a task from the local database using the [TaskEntity] model
  DeleteTaskParams(this.task);

  /// The task to be deleted
  final TaskEntity task;
}
