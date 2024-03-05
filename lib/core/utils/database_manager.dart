import 'package:coding_challenge/core/utils/app_strings.dart';
import 'package:coding_challenge/features/tasks/domain/entities/task_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

/// A class for managing local database operations.
///
/// It uses the [Hive] library to perform operations such as setting and
/// retrieving the preferred language and theme mode.
@lazySingleton
class DatabaseManager {
  /// Initializes [Hive] for local database management.
  static Future<dynamic> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter()); // Make sure to register the adapter
    await Hive.openBox<TaskEntity>('tasks');
    await Hive.openBox<dynamic>('settings');
  }

  /// Adds a new task to the database
  Future<void> addTask(TaskEntity task) async {
    final box = Hive.box<TaskEntity>('tasks');
    await box.add(task);
  }

  /// Retrieves all tasks from the database
  Future<List<TaskEntity>> getAllTasks() async {
    final box = Hive.box<TaskEntity>('tasks');
    return box.values.toList();
  }

  /// Edits an existing task
  Future<TaskEntity> editTask({
    required TaskEntity task,
    required String newName,
    required bool isChecked,
  }) async {
    task
      ..name = newName
      ..isChecked = isChecked;
    await task.save();
    return task;
  }

  /// Sets the preferred language code in the database.
  void setLanguage(String languageCode) {
    Hive.box<dynamic>('settings').put('language', languageCode);
  }

  /// Retrieves the preferred language code from the database.
  Future<String> getLanguage() async {
    final box = Hive.box<dynamic>('settings');
    final langCode = box.get('language');
    return Future.value(
      (langCode as String?) == null ? AppStrings.englishCode : langCode,
    );
  }

  /// Sets the preferred theme mode in the database.
  void setThemeMode(String themeMode) {
    Hive.box<dynamic>('settings').put('themeMode', themeMode);
  }

  /// Retrieves the preferred theme mode from the database.
  Future<String> getThemeMode() async {
    final box = Hive.box<dynamic>('settings');
    final themeMode = box.get('themeMode');
    return Future.value(
      (themeMode as String?) == null ? ThemeMode.system.name : themeMode,
    );
  }

  /// Clears all data from the database.
  ///
  /// Note: This method is intended for debugging purposes only.
  static Future<void> clearData() async {
    await Hive.box<dynamic>('settings').clear();
    await Hive.box<TaskEntity>('tasks').clear();
  }
}
