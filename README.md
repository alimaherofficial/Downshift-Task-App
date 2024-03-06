# Downshift Task App

<!-- > A brief description of your app. -->
This is a Flutter project that aims to provide a simple and clean task management app. It is built with a clean architecture and follows best practices in software development.

## Features

- List the core features of your app. For example:
  - Splash screen with theme mode and language selection.
  - Task management (add, delete, update tasks).
  - Customizable themes and localization support for English and French.

## Getting Started

This project is a starting point for a Flutter application.

### Prerequisites

Before you begin, ensure you have met the following requirements:
- Flutter installed on your machine.
- An IDE (VSCode, Android Studio, or IntelliJ) with Flutter plugin installed.

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/yourprojectname.git
```


2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

Briefly describe the structure of your project:

- `lib/`: Contains the Dart files for the application.
  - `app.dart`: The application's entry point.
  - `config/`: Configuration files for routes and themes.
  - `core/`: Core functionalities including base use case, error handling, and utilities.
  - `features/`: Feature-wise breakdown (e.g., splash, tasks) with data, domain, and presentation layers.
- `pubspec.yaml`: Manages the assets and dependencies of the project.

For a detailed look at the project structure, see the [project tree](#project-tree).

## Acknowledgments

- Bloc library for state management in Flutter.
- GetIt for dependency injection.
- Flutter Intl for localization support.

## Project Tree

```
├─ lib
│  ├─ app.dart
│  ├─ config
│  │  ├─ routes
│  │  │  ├─ app_pages.dart
│  │  │  └─ app_routes.dart
│  │  └─ themes
│  │     ├─ app_theme.dart
│  │     └─ app_theme_dark.dart
│  ├─ core
│  │  ├─ base_usecase.dart
│  │  ├─ errors
│  │  │  └─ failures.dart
│  │  ├─ injection_container.config.dart
│  │  ├─ injection_container.dart
│  │  ├─ utils
│  │  │  ├─ app_colors.dart
│  │  │  ├─ app_strings.dart
│  │  │  ├─ app_values.dart
│  │  │  ├─ assets.dart
│  │  │  ├─ bloc_observer.dart
│  │  │  ├─ database_manager.dart
│  │  │  ├─ locale_helper.dart
│  │  │  ├─ multi_bloc_manager.dart
│  │  │  ├─ no_glow.dart
│  │  │  ├─ sized_x.dart
│  │  │  └─ theme_helper.dart
│  │  └─ widgets
│  │     ├─ custom_app_bar.dart
│  │     ├─ custom_button.dart
│  │     ├─ custom_checkbox.dart
│  │     ├─ custom_padding.dart
│  │     └─ custom_textfield.dart
│  ├─ features
│  │  ├─ splash
│  │  │  ├─ data
│  │  │  │  ├─ datasources
│  │  │  │  │  └─ splash_local_datasource.dart
│  │  │  │  └─ repositories
│  │  │  │     └─ splash_repo_impl.dart
│  │  │  ├─ domain
│  │  │  │  ├─ repositories
│  │  │  │  │  └─ splash_repo.dart
│  │  │  │  └─ usecases
│  │  │  │     ├─ change_lang.dart
│  │  │  │     ├─ change_theme_mode.dart
│  │  │  │     ├─ get_saved_lang.dart
│  │  │  │     └─ get_saved_theme_mode.dart
│  │  │  └─ presentation
│  │  │     ├─ controllers
│  │  │     │  ├─ main_cubit
│  │  │     │  │  ├─ main_cubit.dart
│  │  │     │  │  └─ main_state.dart
│  │  │     │  └─ splash
│  │  │     │     ├─ splash_cubit.dart
│  │  │     │     └─ splash_state.dart
│  │  │     └─ screens
│  │  │        └─ splash_screen.dart
│  │  └─ tasks
│  │     ├─ data
│  │     │  ├─ datasource
│  │     │  │  └─ tasks_local_datasource.dart
│  │     │  ├─ models
│  │     │  └─ repositories
│  │     │     └─ task_repo_impl.dart
│  │     ├─ domain
│  │     │  ├─ entities
│  │     │  │  ├─ task.g.dart
│  │     │  │  └─ task_entity.dart
│  │     │  ├─ repositories
│  │     │  │  └─ task_repo.dart
│  │     │  └─ usecases
│  │     │     ├─ add_task_usecase.dart
│  │     │     ├─ delete_task_usecase.dart
│  │     │     ├─ get_tasks_usecase.dart
│  │     │     └─ update_task_usecase.dart
│  │     └─ presentation
│  │        ├─ controllers
│  │        │  ├─ edit_task
│  │        │  │  ├─ edit_task_cubit.dart
│  │        │  │  └─ edit_task_state.dart
│  │        │  └─ main_tasks
│  │        │     ├─ tasks_cubit.dart
│  │        │     └─ tasks_state.dart
│  │        └─ screens
│  │           ├─ add_task
│  │           │  └─ add_task_screen.dart
│  │           ├─ edit_task
│  │           │  └─ edit_task_screen.dart
│  │           └─ main_tasks
│  │              ├─ main_tasks_screen.dart
│  │              └─ widgets
│  │                 ├─ custom_blue_container.dart
│  │                 ├─ custom_card.dart
│  │                 ├─ custom_floating_action_button.dart
│  │                 └─ custom_lime_container.dart
│  ├─ generated
│  │  ├─ intl
│  │  │  ├─ messages_all.dart
│  │  │  ├─ messages_en.dart
│  │  │  └─ messages_fr.dart
│  │  └─ l10n.dart
│  ├─ l10n
│  │  ├─ intl_en.arb
│  │  └─ intl_fr.arb
│  └─ main.dart
├─ pubspec.lock
├─ pubspec.yaml
```

## Contact

Your Name - [@AliMaher](https://www.linkedin.com/in/ali-maher-t/)

Project Link: [https://github.com/alimaherofficial/Downshift-Task-App](https://github.com/yourusername/yourprojectname)
