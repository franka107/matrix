# Matrix - Modern Flutter Architecture Demo

[![Flutter Tests](https://github.com/franka107/matrix/actions/workflows/flutter_tests.yml/badge.svg)](https://github.com/franka107/matrix/actions/workflows/flutter_tests.yml)
[![Build APK](https://github.com/franka107/matrix/actions/workflows/flutter_build_apk.yml/badge.svg)](https://github.com/franka107/matrix/actions/workflows/flutter_build_apk.yml)
[![API Documentation](https://github.com/franka107/matrix/actions/workflows/docs_deploy.yml/badge.svg)](https://franka107.github.io/matrix/)

## Overview

Matrix is a demonstration project showcasing modern Flutter development practices, architectural patterns, and DevOps workflows. This project is built as a technical assessment, implementing a comprehensive set of software engineering best practices.

## Demo Videos

### Matrix Rotation Demo

https://github.com/user-attachments/assets/9685a6f7-2f8b-468f-a61f-8e93f142d799

## Architecture & Design Patterns

### Hexagonal Architecture (Ports & Adapters)

The project follows the Hexagonal Architecture pattern, separating the application core from external dependencies:

- **Domain Layer**: Contains business logic, entities, and use cases
- **Application Layer**: Orchestrates the flow of data between domain and adapters
- **Infrastructure Layer**: Implements adapters for external services

### Model-View-Intent (MVI)

The UI follows the MVI pattern, ensuring unidirectional data flow:

- **Model**: Represents the state of the application
- **View**: Renders the UI based on the current state
- **Intent**: Captures user interactions as intents to change the state

### Error Handling with Either

The project uses the Either pattern for comprehensive error handling:

- **Right**: Represents successful operations
- **Left**: Represents failures or errors

## Development Practices

### Test-Driven Development (TDD)

All features are developed using TDD principles:

1. Write failing tests first
2. Implement minimal code to pass tests
3. Refactor while keeping tests passing

### Dependency Injection

The project uses dependency injection for better testability and maintainability:

- Services and repositories are injected into components that depend on them
- Mocks can easily replace real implementations during testing

### Continuous Integration

Robust CI/CD pipelines are implemented using GitHub Actions:

- **Automated Testing**: Every commit runs unit and widget tests
- **Build Pipeline**: Automatic APK generation with semantic versioning
- **Documentation**: Automatic generation and deployment of API docs

## Technologies & Libraries

- **State Management**: Flutter Bloc for implementing the MVI architecture
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it) for service locator pattern
- **Testing**: Flutter test framework with mocked dependencies
- **CI/CD**: GitHub Actions with Commitizen for conventional commits

## Getting Started

### Prerequisites

- Flutter SDK 3.29.1 or higher
- Android Studio / VS Code with Flutter extensions

### Installation

```bash
# Clone the repository
git clone https://github.com/franka107/matrix.git

# Navigate to project directory
cd matrix

# Get dependencies
flutter pub get

# Run the app
flutter run

### Running Tests

# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Project Structure

```bash
lib/
├── features/                          # Main application modules
│   └── shared_kernel/                 # Components shared across features
│       ├── application/               # Application layer
│       │   └── di/                    # Dependency injection
│       ├── domain/                    # Business logic
│       │   ├── entities/              # Domain entities
│       │   ├── repositories/          # Repository interfaces
│       │   └── use_case/              # Use cases
│       └── presentation/              # Presentation layer
│           ├── navigation/            # Routing configuration
│           └── page/                  # Application pages
│               ├── matrix_input/      # Matrix input page
│               │   └── bloc/          # BLoC components for MVI
│               ├── matrix_result/     # Rotation result page
│               │   └── bloc/          # BLoC components for MVI
│               └── settings/          # Application settings
├── platform/                          # Platform abstractions
│   └── bloc/                          # Base BLoC implementation
└── main.dart                          # Application entry point

test/
├── features/                          # Tests mirroring lib/ structure
│   └── shared_kernel/
│       ├── domain/                    # Domain logic tests
│       │   └── use_case/              # Use case tests
│       └── presentation/              # UI component tests
└── widget_test.dart                   # Widget integration tests

assets/
├── images/                            # Static images
└── videos/                            # Demo videos and animations
```



## Documentation

- [API Documentation](https://franka107.github.io/matrix/)
- [Release Notes](https://github.com/franka107/matrix/releases)

## Contributing

1. Follow conventional commits with Commitizen
2. Write tests for all new features
3. Ensure all CI checks pass before submitting PRs

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- Flutter team for the excellent framework
- Open source community for tools and libraries
