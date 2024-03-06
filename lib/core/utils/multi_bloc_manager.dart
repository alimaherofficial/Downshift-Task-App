import 'package:coding_challenge/core/injection_container.dart';
import 'package:coding_challenge/features/splash/domain/usecases/change_lang.dart';
import 'package:coding_challenge/features/splash/domain/usecases/change_theme_mode.dart';
import 'package:coding_challenge/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:coding_challenge/features/splash/domain/usecases/get_saved_theme_mode.dart';
import 'package:coding_challenge/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/add_task_usecase.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:coding_challenge/features/tasks/domain/usecases/update_task_usecase.dart';
import 'package:coding_challenge/features/tasks/presentation/controllers/main_tasks/tasks_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:nested/nested.dart';

/// this class is used to manage the multi bloc provider and multi bloc listener
class MultiBlocManager {
  // ignore: public_member_api_docs
  static List<SingleChildWidget> multiBlocProviderList = [
    BlocProvider(
      create: (context) => MainCubit(
        getIt<GetSavedLangUseCase>(),
        getIt<ChangeLangUseCase>(),
        getIt<GetSavedThemeModeUseCase>(),
        getIt<ChangeThemeModeUseCase>(),
      )
        ..getSavedLang()
        ..getSavedThemeMode(),
    ),
    BlocProvider(
      create: (context) => TasksCubit(
        getIt<GetTasksUseCase>(),
        getIt<AddTaskUseCase>(),
        getIt<UpdateTaskUseCase>(),
        getIt<DeleteTaskUseCase>(),
      )..getTasks(),
    ),
  ];

  /// this method is used to get the multi bloc listener list
  static List<SingleChildWidget> get multiBlocListenersList {
    return [];
  }
}


