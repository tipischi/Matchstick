# Matchstick Project Structure

## Overview
This document describes the folder structure and organization of the Matchstick Flutter project.

## Folder Structure

```
matchstick/
├── android/                 # Android-specific code
├── assets/                  # Static assets
│   ├── images/             # Image assets (flame animations, icons, etc.)
│   ├── animations/         # Animation files
│   └── sounds/             # Sound effects (crackling fire, wood dropping, etc.)
├── lib/                    # Main Dart code
│   ├── core/              # Core application logic
│   │   ├── constants/     # App-wide constants
│   │   │   └── app_constants.dart
│   │   ├── enums/         # Enumerations
│   │   │   ├── flame_stage.dart
│   │   │   └── challenge_category.dart
│   │   └── models/        # Data models
│   │       ├── flame_data.dart
│   │       ├── challenge.dart
│   │       └── completion_log.dart
│   ├── features/          # Feature modules
│   │   ├── flame/         # Flame screen and logic
│   │   │   ├── models/
│   │   │   ├── providers/
│   │   │   ├── screens/
│   │   │   └── widgets/
│   │   ├── challenges/    # Challenge system
│   │   │   ├── models/
│   │   │   ├── providers/
│   │   │   ├── screens/
│   │   │   └── widgets/
│   │   ├── onboarding/    # AI-powered onboarding
│   │   │   ├── screens/
│   │   │   └── widgets/
│   │   └── banking/       # Bank the fire feature
│   │       ├── screens/
│   │       └── widgets/
│   ├── services/          # External services
│   │   ├── storage_service.dart       # Hive & SharedPreferences
│   │   ├── notification_service.dart  # Local notifications
│   │   ├── deepseek_service.dart      # AI API integration
│   │   └── widget_service.dart        # Home screen widget
│   ├── utils/             # Utility functions
│   └── main.dart          # App entry point
├── test/                  # Unit tests
├── pubspec.yaml           # Dependencies
├── PRODUCT_SPEC.md        # Product specification
├── PROJECT_STRUCTURE.md   # This file
└── README.md              # Project README
```

## Key Files

### Core Models
- `flame_data.dart` - Main flame state (fuel, stage, streak, etc.)
- `challenge.dart` - Challenge definition
- `completion_log.dart` - Log of completed challenges

### Core Enums
- `flame_stage.dart` - 6 flame stages (Spark → Bonfire)
- `challenge_category.dart` - Challenge categories (Physical, Mental, Social, Custom)

### Constants
- `app_constants.dart` - All app-wide constants (API URLs, limits, box names, etc.)

## Architecture

### State Management
- **Riverpod** for reactive state management
- **Hive** for local data persistence
- **SharedPreferences** for simple key-value storage

### Features
Each feature follows a modular structure:
- `models/` - Feature-specific data models
- `providers/` - Riverpod providers for state
- `screens/` - Full-screen UI
- `widgets/` - Reusable UI components

### Services
Services handle external interactions:
- Storage (Hive boxes, SharedPreferences)
- Notifications (local notifications)
- AI API (DeepSeek integration)
- Widget updates (home screen widget)

## Development Workflow

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Generate Code (Hive adapters, Riverpod)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Run the App
```bash
flutter run
```

### 4. Run Tests
```bash
flutter test
```

## Code Generation

The project uses code generation for:
- **Hive** type adapters (for local storage)
- **Riverpod** code generation (for providers)

Generated files have `.g.dart` extension and are auto-created by build_runner.

## Next Steps

1. ✅ Project structure created
2. ✅ Core models defined
3. ✅ Dependencies added
4. 🔄 Generate Hive adapters
5. 🔄 Implement flame screen
6. 🔄 Implement challenge system
7. 🔄 Implement banking mechanic
8. 🔄 Implement AI onboarding
9. 🔄 Implement home screen widget
10. 🔄 Add animations and polish
