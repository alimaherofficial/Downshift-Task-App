import 'package:bloc_test/bloc_test.dart';
import 'package:coding_challenge/features/tasks/data/datasource/tasks_local_datasource.dart';
import 'package:coding_challenge/features/tasks/data/repositories/task_repo_impl.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/add_task_usecase.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/update_task_usecase.dart';
import 'package:coding_challenge/features/tasks/presentation/controllers/main_tasks/tasks_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('main tasks cubit test', () {
    late TasksCubit tasksCubit;

    setUp(
      () => tasksCubit = TasksCubit(
        GetTasksUseCase(
          TaskRepoImpl(
            MockTasksLocalDatasource(),
          ),
        ),
        AddTaskUseCase(
          TaskRepoImpl(
            MockTasksLocalDatasource(),
          ),
        ),
        UpdateTaskUseCase(
          TaskRepoImpl(
            MockTasksLocalDatasource(),
          ),
        ),
        DeleteTaskUseCase(
          TaskRepoImpl(
            MockTasksLocalDatasource(),
          ),
        ),
      ),
    );
    tearDown(() {
      tasksCubit.close();
    });
    blocTest<TasksCubit, TasksState>(
      'getTasks emits [TasksLoading, TasksLoaded] when successful',
      build: () => tasksCubit,
      act: (cubit) => cubit.getTasks(),
      expect: () => [
        isA<TasksLoading>(),
        isA<TasksLoaded>(),
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'addTask emits [TasksLoading, TasksLoaded] when successful',
      build: () => tasksCubit,
      act: (cubit) {
        TestWidgetsFlutterBinding.ensureInitialized();
        cubit.addTaskController.text = 'task3';

        return cubit.addTask(
          TaskEntity(
            name: 'task3',
            updatedAt: DateTime.now(),
          ),
        );
      },
      expect: () => [
        isA<TasksLoaded>(),
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'updateTask emits [TasksLoading, TasksLoaded] when successful',
      build: () => tasksCubit,
      act: (cubit) {
        TestWidgetsFlutterBinding.ensureInitialized();
        cubit.tasks.add(
          TaskEntity(
            name: 'task3',
            updatedAt: DateTime.now(),
          ),
        );

        return cubit.updateTask(
          TaskEntity(
            name: 'task3',
            updatedAt: DateTime.now(),
          ),
        );
      },
      expect: () => [
        isA<TasksLoaded>(),
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'deleteTask emits [TasksLoading, TasksLoaded] when successful',
      build: () => tasksCubit,
      act: (cubit) {
        TestWidgetsFlutterBinding.ensureInitialized();
        cubit.tasks.add(
          TaskEntity(
            name: 'task3',
            updatedAt: DateTime.now(),
          ),
        );

        return cubit.deleteTask(
          TaskEntity(
            name: 'task3',
            updatedAt: DateTime.now(),
          ),
        );
      },
      expect: () => [
        isA<TasksLoaded>(),
      ],
    );
  });
}

class MockTasksLocalDatasource extends Mock implements TasksLocalDatasource {
  @override
  Future<List<TaskEntity>> getTasks() {
    return Future.sync(
      () => [
        TaskEntity(
          name: 'task1',
          updatedAt: DateTime.now(),
        ),
        TaskEntity(
          name: 'task2',
          updatedAt: DateTime.now(),
        ),
      ],
    );
  }

  @override
  Future<void> addTask(TaskEntity task) {
    return Future.sync(() => null);
  }

  @override
  Future<void> deleteTask(TaskEntity task) {
    return Future.sync(() => null);
  }

  @override
  Future<void> updateTask(TaskEntity task) {
    return Future.sync(() => null);
  }
}
