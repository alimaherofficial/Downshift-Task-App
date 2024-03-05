import 'package:coding_challenge/core/utils/database_manager.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:injectable/injectable.dart';

/// Abstract class for the local datasource
/// that will be implemented by the [TasksLocalDatasourceImpl]
/// this class will be used to interact with the local database
abstract class TasksLocalDatasource {
  /// Add a task to the local database using the [TaskEntity] model
  Future<void> addTask(TaskEntity task);

  /// Delete a task from the local database using the [TaskEntity] model
  Future<void> deleteTask(TaskEntity task);

  /// Update a task from the local database using the [TaskEntity] model
  Future<void> updateTask(TaskEntity task);

  /// Get all the tasks from the local database
  Future<List<TaskEntity>> getTasks();
}

/// Implementation of the [TasksLocalDatasource] abstract class
/// this class used to manage all the tasks related operations
@LazySingleton(as: TasksLocalDatasource)
class TasksLocalDatasourceImpl implements TasksLocalDatasource {
  /// Constructor for the [TasksLocalDatasourceImpl]
  TasksLocalDatasourceImpl(this._databaseManager);

  final DatabaseManager _databaseManager;

  @override
  Future<void> addTask(TaskEntity task) async {
    await _databaseManager.addTask(task);
  }

  @override
  Future<void> deleteTask(TaskEntity task) async {
    await task.delete();
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    final result = await _databaseManager.getAllTasks();
    return result;
  }

  @override
  Future<TaskEntity> updateTask(TaskEntity task) async {
    final result = await _databaseManager.editTask(
      task: task,
      newName: task.name,
      isChecked: task.isChecked,
    );
    return result;
  }
}
