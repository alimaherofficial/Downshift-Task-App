import 'package:coding_challenge/core/base_usecase.dart';
import 'package:coding_challenge/core/errors/failures.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:coding_challenge/features/tasks/domain/repositories/task_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// The use case for getting tasks
/// this class will be used to get tasks from the local database
/// using the [TaskEntity] model
/// this class extends the [BaseUseCase] class
@lazySingleton
class GetTasksUseCase
    extends BaseUseCase<Failure, List<TaskEntity>, NoParameters> {
  /// Constructor for the [GetTasksUseCase]
  GetTasksUseCase(this._taskRepo);

  /// The [TaskRepo] to be used to get tasks
  final TaskRepo _taskRepo;

  @override
  Future<Either<Failure, List<TaskEntity>>> call(
    NoParameters parameters,
  ) async {
    final result = _taskRepo.getTasks();
    return result;
  }
}
