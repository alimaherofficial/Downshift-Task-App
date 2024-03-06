import 'package:bloc_test/bloc_test.dart';
import 'package:coding_challenge/features/splash/data/datasources/splash_local_datasource.dart';
import 'package:coding_challenge/features/splash/data/repositories/splash_repo_impl.dart';
import 'package:coding_challenge/features/splash/domain/usecases/change_lang.dart';
import 'package:coding_challenge/features/splash/domain/usecases/change_theme_mode.dart';
import 'package:coding_challenge/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:coding_challenge/features/splash/domain/usecases/get_saved_theme_mode.dart';
import 'package:coding_challenge/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// class MockBuildContext extends Mock implements BuildContext {}

class MockSplashLocalDataSource extends Mock implements SplashLocalDataSource {
  @override
  Future<String> getSavedThemeMode() async {
    return 'dark';
  }
}

void main() {
  group('Test Change Theme Success State', () {
    late MainCubit mainCubit;

    setUp(
      () => mainCubit = MainCubit(
        GetSavedLangUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
        ChangeLangUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
        GetSavedThemeModeUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
        ChangeThemeModeUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
      ),
    );
    tearDown(() {
      mainCubit.close();
    });
    testWidgets(
      'changeTheme updates theme mode correctly',
      (WidgetTester tester) async {
        WidgetsFlutterBinding.ensureInitialized();
        const testKey = Key('K');
        await tester.pumpWidget(
          BlocProvider(
            create: (context) => mainCubit,
            child: MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) => ElevatedButton(
                    key: testKey,
                    onPressed: () async {
                      await mainCubit.changeTheme(
                        themeMode: ThemeMode.dark.name,
                        context: context,
                      );
                    },
                    child: const Text('Change Theme'),
                  ),
                ),
              ),
            ),
          ),
        );

        /// tap the button
        await tester.tap(find.byKey(testKey));

        /// wait for the widget to rebuild
        await tester.pumpAndSettle();

        expect(
          mainCubit.currentThemeMode.name,
          ThemeMode.dark.name,
        );
      },
    );
  });

  group('Test Get Saved Method In Main Cubit With BlocTest', () {
    late MainCubit mainCubit;

    setUp(
      () => mainCubit = MainCubit(
        GetSavedLangUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
        ChangeLangUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
        GetSavedThemeModeUseCase(
          /// Mock the SplashRepoImpl to return a specific theme mode (NOTE)
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: MockSplashLocalDataSource(),
          ),
        ),
        ChangeThemeModeUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
      ),
    );
    tearDown(() {
      mainCubit.close();
    });

    blocTest<MainCubit, MainState>(
      'Get Saved Theme Mode Success State',
      build: () => mainCubit,
      act: (cubit) => cubit.getSavedThemeMode(),
      verify: (_) {
        /// You can also verify the final theme mode if necessary
        expect(mainCubit.currentThemeMode, ThemeMode.dark);
      },
    );
  });

  group('Test Change Language Success State', () {
    late MainCubit mainCubit;

    setUp(
      () => mainCubit = MainCubit(
        GetSavedLangUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
        ChangeLangUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
        GetSavedThemeModeUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
        ChangeThemeModeUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
      ),
    );
    tearDown(() {
      mainCubit.close();
    });
    testWidgets(
      'changeTheme updates theme mode correctly',
      (WidgetTester tester) async {
        WidgetsFlutterBinding.ensureInitialized();
        const testKey = Key('K');
        await tester.pumpWidget(
          BlocProvider(
            create: (context) => mainCubit,
            child: MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) => ElevatedButton(
                    key: testKey,
                    onPressed: () async {
                      await mainCubit.changeLang(
                        'ar',
                      );
                    },
                    child: const Text('Change Theme'),
                  ),
                ),
              ),
            ),
          ),
        );

        /// tap the button
        await tester.tap(find.byKey(testKey));

        /// wait for the widget to rebuild
        await tester.pumpAndSettle();

        expect(
          mainCubit.currentLangCode,
          'ar',
        );
      },
    );
  });

  group('Test Get Saved Language Success State', () {
    late MainCubit mainCubit;

    setUp(
      () => mainCubit = MainCubit(
        GetSavedLangUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
        ChangeLangUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
        GetSavedThemeModeUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
        ChangeThemeModeUseCase(
          splashRepo: SplashRepoImpl(
            splashLocalDataSource: SplashLocalDataSourceImpl(),
          ),
        ),
      ),
    );
    tearDown(() {
      mainCubit.close();
    });

    blocTest<MainCubit, MainState>(
      'Get Saved Language Success State',
      build: () => mainCubit,
      act: (cubit) => cubit.getSavedLang(),
      verify: (_) {
        expect(mainCubit.currentLangCode, 'en');
      },
    );
  });
}
