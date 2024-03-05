import 'package:coding_challenge/core/base_usecase.dart';
import 'package:coding_challenge/core/errors/failures.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:coding_challenge/features/tasks/domain/repositories/task_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// The use case for adding a task
/// this class will be used to add a task to the local database
/// using the [TaskEntity] model
/// this class extends the [BaseUseCase] class
/// and implements the call method
/// the call method will take [AddTaskPrams] as a parameter
/// and return a [Future] of [Either] [Failure] or [Unit]
@lazySingleton
class AddTaskUseCase extends BaseUseCase<Failure, Unit, AddTaskPrams> {
  /// Constructor for the [AddTaskUseCase]
  AddTaskUseCase(this._taskRepo);

  final TaskRepo _taskRepo;

  @override
  Future<Either<Failure, Unit>> call(AddTaskPrams parameters) async {
    final result = await _taskRepo.addTask(parameters.task);
    return result;
  }
}

/// The parameters for the [AddTaskUseCase]
class AddTaskPrams {
  /// Add a task to the local database using the [TaskEntity] model
  AddTaskPrams(this.task);

  /// The task to be added
  final TaskEntity task;
}
