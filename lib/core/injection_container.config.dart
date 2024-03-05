// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/splash/data/datasources/splash_local_datasource.dart'
    as _i4;
import '../features/splash/data/repositories/splash_repo_impl.dart' as _i6;
import '../features/splash/domain/repositories/splash_repo.dart' as _i5;
import '../features/splash/domain/usecases/change_lang.dart' as _i8;
import '../features/splash/domain/usecases/change_theme_mode.dart' as _i9;
import '../features/splash/domain/usecases/get_saved_lang.dart' as _i10;
import '../features/splash/domain/usecases/get_saved_theme_mode.dart' as _i11;
import '../features/tasks/data/datasource/tasks_local_datasource.dart' as _i7;
import '../features/tasks/data/repositories/task_repo_impl.dart' as _i13;
import '../features/tasks/domain/repositories/task_repo.dart' as _i12;
import '../features/tasks/domain/usecases/add_task_usecase.dart' as _i15;
import '../features/tasks/domain/usecases/delete_task_usecase.dart' as _i16;
import '../features/tasks/domain/usecases/get_tasks_usecase.dart' as _i17;
import '../features/tasks/domain/usecases/update_task_usecase.dart' as _i14;
import 'utils/database_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DatabaseManager>(() => _i3.DatabaseManager());
    gh.lazySingleton<_i4.SplashLocalDataSource>(
        () => _i4.SplashLocalDataSourceImpl());
    gh.lazySingleton<_i5.SplashRepo>(() => _i6.SplashRepoImpl(
        splashLocalDataSource: gh<_i4.SplashLocalDataSource>()));
    gh.lazySingleton<_i7.TasksLocalDatasource>(
        () => _i7.TasksLocalDatasourceImpl(gh<_i3.DatabaseManager>()));
    gh.lazySingleton<_i8.ChangeLangUseCase>(
        () => _i8.ChangeLangUseCase(splashRepo: gh<_i5.SplashRepo>()));
    gh.lazySingleton<_i9.ChangeThemeModeUseCase>(
        () => _i9.ChangeThemeModeUseCase(splashRepo: gh<_i5.SplashRepo>()));
    gh.lazySingleton<_i10.GetSavedLangUseCase>(
        () => _i10.GetSavedLangUseCase(splashRepo: gh<_i5.SplashRepo>()));
    gh.lazySingleton<_i11.GetSavedThemeModeUseCase>(
        () => _i11.GetSavedThemeModeUseCase(splashRepo: gh<_i5.SplashRepo>()));
    gh.lazySingleton<_i12.TaskRepo>(
        () => _i13.TaskRepoImpl(gh<_i7.TasksLocalDatasource>()));
    gh.lazySingleton<_i14.UpdateTaskUseCase>(
        () => _i14.UpdateTaskUseCase(gh<_i12.TaskRepo>()));
    gh.lazySingleton<_i15.AddTaskUseCase>(
        () => _i15.AddTaskUseCase(gh<_i12.TaskRepo>()));
    gh.lazySingleton<_i16.DeleteTaskUseCase>(
        () => _i16.DeleteTaskUseCase(gh<_i12.TaskRepo>()));
    gh.lazySingleton<_i17.GetTasksUseCase>(
        () => _i17.GetTasksUseCase(gh<_i12.TaskRepo>()));
    return this;
  }
}
