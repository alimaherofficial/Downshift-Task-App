import 'package:coding_challenge/core/base_usecase.dart';
import 'package:coding_challenge/core/errors/failures.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:coding_challenge/features/tasks/domain/repositories/task_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// The use case for updating a task
/// this class will be used to update a task from the local database
/// using the [TaskEntity] model
/// this class extends the [BaseUseCase] class
@lazySingleton
class UpdateTaskUseCase extends BaseUseCase<Failure, Unit, UpdateTaskParams> {
  /// Constructor for the [UpdateTaskUseCase]
  UpdateTaskUseCase(this._taskRepo);

  final TaskRepo _taskRepo;

  @override
  Future<Either<Failure, Unit>> call(UpdateTaskParams parameters) async {
    final result = await _taskRepo.updateTask(parameters.task);
    return result;
  }
}

/// The parameters for the [UpdateTaskUseCase]
class UpdateTaskParams {
  /// constructor for the [UpdateTaskParams]
  UpdateTaskParams(this.task);

  /// The task to be updated
  final TaskEntity task;
}
