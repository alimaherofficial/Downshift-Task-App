// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No tasks yet`
  String get noTasksYet {
    return Intl.message(
      'No tasks yet',
      name: 'noTasksYet',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Add New Task`
  String get addNewTask {
    return Intl.message(
      'Add New Task',
      name: 'addNewTask',
      desc: '',
      args: [],
    );
  }

  /// `Enter task name`
  String get enterTaskName {
    return Intl.message(
      'Enter task name',
      name: 'enterTaskName',
      desc: '',
      args: [],
    );
  }

  /// `Task Name`
  String get taskName {
    return Intl.message(
      'Task Name',
      name: 'taskName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter task name`
  String get pleaseEnterTaskName {
    return Intl.message(
      'Please enter task name',
      name: 'pleaseEnterTaskName',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Task`
  String get editTask {
    return Intl.message(
      'Edit Task',
      name: 'editTask',
      desc: '',
      args: [],
    );
  }

  /// `Hello, Manuel`
  String get helloManuel {
    return Intl.message(
      'Hello, Manuel',
      name: 'helloManuel',
      desc: '',
      args: [],
    );
  }

  /// `What are your plans \nfor today?`
  String get whatAreYourPlansNforToday {
    return Intl.message(
      'What are your plans \\nfor today?',
      name: 'whatAreYourPlansNforToday',
      desc: '',
      args: [],
    );
  }

  /// `Go Pro (No Ads)`
  String get goProNoAds {
    return Intl.message(
      'Go Pro (No Ads)',
      name: 'goProNoAds',
      desc: '',
      args: [],
    );
  }

  /// `No fuss, no ads, for only \$1 a \nmonth`
  String get noFussNoAdsForOnly1ANmonth {
    return Intl.message(
      'No fuss, no ads, for only \\\$1 a \\nmonth',
      name: 'noFussNoAdsForOnly1ANmonth',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
