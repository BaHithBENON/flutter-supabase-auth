# flutter-supabase-auth

- [Cliquez ici pour voir la version française du README](README_FR.md)

## Project Description

`flutter-supabase-auth` is a project demonstrating the implementation of an authentication system for a `Flutter` application using `Supabase`. This project follows the principles of `clean architecture` and `modularity` to ensure a clear separation of responsibilities and better maintainability of the code.

## Key Features
  - Modules (Independent features)
  - Clean Architecture
  - State Management with `GetX`
  - Authentication with `Supabase`
  - Initializing `OneSignal` for `push notifications` with Supabase
  - Other Useful Features (configurations, utilities, services, etc.)

## Project Architecture

The architecture of this project is organized into several folders and files, each serving a specific role. Here is a detailed description of the architecture :

### Directory Structure

```
/app_folder
├── /assets
│   ├── /fonts
│   ├── /images
│   └── /etc...
├── /lib
│   ├── /src
│   │   ├── /commons
│   │   ├── /core
│   │   ├── /features
│   │   │   ├── /authentication
│   │   │   │   ├── /controllers
│   │   │   │   │   └── authentication_controller.dart
│   │   │   │   ├── /ui
│   │   │   │   │   ├── /widgets
│   │   │   │   │   │   └── social_auth_widget.dart
│   │   │   │   │   ├── signin_ui.dart
│   │   │   │   │   └── signup_ui.dart
│   │   │   ├── /users
│   │   │   └── /etc...
│   │   └── app.dart
│   ├── init_dependencies.dart
│   ├── init_dependencies.main.dart
│   └── main.dart
├── /libs
│   ├── /core
│   └── /modules
│       ├── /authentication
│       ├── /user_management
│       └── /etc...
├── pubspec.yaml
└── pubspec.lock
```

### Folder and File Descriptions

- **/app_folder**: The root folder of the project containing all necessary files and subfolders.
  
- **/assets**: Contains static resources such as fonts, images, and other static assets used in the application.
  
- **/lib**: The main source code directory of the Flutter application.
  - **/src**: Contains the main sources of the application.
    - **/commons**: Groups common and reusable elements throughout the application.
    - **/core**: Contains central elements of the application, such as global configurations and utilities.
    - **/features**: Folder dedicated to the application's features.
      - **/authentication**: Specific module for authentication.
        - **/controllers**: Contains controllers responsible for business logic related to authentication, managed by GetX.
          - `authentication_controller.dart`: Main controller for managing authentication processes with GetX.
        - **/ui**: Groups user interface elements related to authentication.
          - **/widgets**: Contains custom widgets used in authentication interfaces.
            - `social_auth_widget.dart`: Widget for social network authentication.
          - `signin_ui.dart`: Sign-in interface.
          - `signup_ui.dart`: Sign-up interface.
      - **/users**: Module for user management.
      - **/etc...**: Other feature-specific modules.
    - `app.dart`: Entry point of the application, general configuration.
  - `init_dependencies.dart`: Configuration file to initialize dependencies, including GetX and OneSignal.
  - `init_dependencies.main.dart`: Main file to initialize dependencies specific to execution.
  - `main.dart`: Main entry point of the Flutter application.
  
- **/libs**: Contains external libraries and modules.
  - **/core**: Central libraries and utilities.
  - **/modules**: Specific modules used by the application.
    - **/authentication**: External authentication module.
    - **/user_management**: User management module.
    - **/etc...**: Other specific modules.
  
- `pubspec.yaml`: Project dependency configuration file.
- `pubspec.lock`: Dependency lock file to ensure version consistency.

### Advantages of This Architecture

1. **Modularity** : Each feature of the application is isolated in a specific module, making it easier to maintain and evolve the code.
2. **Separation of Responsibilities**: The architecture follows the principle of separation of concerns, clearly separating business logic (controllers) from the user interface (UI).
3. **Reusability** : Common components and utilities are grouped in specific folders, allowing for reuse throughout the application.
4. **Scalability** : The modular organization makes it easy to add new features without disrupting existing modules.
5. **Clarity** : The project structure is clear and well-defined, making it easier for new developers and contributors to understand.
6. **OneSignal Initialization** : Integrated configuration of OneSignal for push notifications.
7. **Other Useful Features** : Additional configurations, utilities, and services are organized to enhance overall application efficiency and functionality.

---
## Authentication Module Architecture

The authentication module is organized into a clean and modular structure, ensuring clear separation of concerns and maintainability. Here's a detailed description of the authentication module's architecture:

### Directory Structure

```
/modules
├── /authentication
│   ├── /lib
│   │   ├── /data
│   │   │   ├── /data_sources
│   │   │   │   ├── auth_remote_data_source_impl.dart
│   │   │   │   ├── auth_remote_data_source.dart
│   │   │   ├── /models
│   │   │   │   ├── model_user.dart
│   │   │   ├── /repositories
│   │   │   │   ├── auth_repository_impl.dart
│   │   ├── /domain 
│   │   │   ├── /entities
│   │   │   │   ├── entity_user.dart
│   │   │   ├── /repositories
│   │   │   │   ├── auth_repository.dart
│   │   │   ├── /usecases
│   │   │   │   ├── login_by_email_and_password_usecase.dart
│   │   │   │   ├── logout_usecase.dart
│   │   │   │   ├── register_by_email_and_password_usecase.dart
│   │   │   │   ├── etc...
│   ├── /test
├── /user_management
└── /etc
```

### Folder and File Descriptions

- **/modules**: The root folder containing all modules of the application.
  - **/authentication**: The authentication module folder.
    - **/lib**: Contains the core logic and structure for the authentication module.
      - **/data**: Manages data-related operations.
        - **/data_sources**: Contains the data sources, including remote or local data fetching.
          - `auth_remote_data_source_impl.dart`: Implementation of the remote data source for authentication.
          - `auth_remote_data_source.dart`: Interface defining the remote data source for authentication.
        - **/models**: Contains data models used in the authentication process.
          - `model_user.dart`: Model representing the user data structure.
        - **/repositories**: Manages data repositories, the interface between data sources and the domain layer.
          - `auth_repository_impl.dart`: Implementation of the authentication repository, handling data operations.
      - **/domain**: Contains the business logic of the authentication module.
        - **/entities**: Defines the core entities used in the business logic.
          - `entity_user.dart`: Entity representing a user in the domain layer.
        - **/repositories**: Contains repository interfaces, abstracting the data operations.
          - `auth_repository.dart`: Interface for the authentication repository.
        - **/usecases**: Contains use cases, representing specific business actions or operations.
          - `login_by_email_and_password_usecase.dart`: Use case for logging in with email and password.
          - `logout_usecase.dart`: Use case for logging out.
          - `register_by_email_and_password_usecase.dart`: Use case for registering with email and password.
          - `etc...`: Placeholder for other use cases as needed.

### Advantages of This Architecture

1. **Modularity**: Each aspect of the authentication process is separated into distinct folders, making the code more manageable and understandable.
2. **Separation of Concerns**: The architecture clearly separates data handling, business logic, and entities, ensuring each layer has a specific responsibility.
3. **Maintainability**: The organized structure allows for easier maintenance and updates, as changes in one part of the module do not affect others.
4. **Scalability**: New features and functionalities can be added with minimal disruption to existing code, enhancing the scalability of the application.
5. **Reusability**: Common components and logic are encapsulated in specific files, promoting reusability across the application.

---

By using this architecture, the `flutter-supabase-auth` project ensures a solid and extensible foundation for developing Flutter applications integrating authentication with Supabase.