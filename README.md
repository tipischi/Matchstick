# 🔥 Matchstick - Keep Your Fire Burning

A mental toughness app built with Flutter. Light your match and keep it burning by completing hard challenges. Miss a day? Your flame dies. Hard reset. Start over.

**Inspired by David Goggins' cookie jar philosophy** - this app turns discipline into a living, breathing fire you must maintain through daily hard actions.

## Core Concept

- **Light a match** on first open
- **Complete hard challenges** to add fuel (measured in kg)
- **Fuel burns in real-time** - creates constant urgency
- **Fuel hits 0 = DEATH** - lose everything, hard reset
- **Bank your fire** before sleep (80% burn reduction)
- **Challenge tiers unlock** as your flame grows

### Flame Progression
- 🔥 **Spark** → **Match** → **Kindling** → **Small Fire** → **Campfire** → **Bonfire** 🔥

Bigger flames unlock bigger challenges. Maintaining a Bonfire is just as hard as maintaining a Spark - you're just doing objectively harder things.

## Tech Stack

- **Flutter** (Dart 3.10.7+)
- **Riverpod** - State management
- **Hive** - Local storage (no backend!)
- **DeepSeek API** - AI-powered onboarding
- **Local notifications** - Fuel warnings
- **Home screen widget** - Constant visibility

## Project Structure

```
lib/
├── core/              # Core models, enums, constants
├── features/          # Feature modules (flame, challenges, banking, onboarding)
├── services/          # External services (storage, notifications, AI)
├── utils/             # Utility functions
└── main.dart          # App entry point
```

See [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) for detailed structure.

## Setup

### Prerequisites

- Flutter SDK (3.10.7+)
- Android Studio
- Android SDK (API 23+)

### Quick Start

```bash
# 1. Install dependencies
flutter pub get

# 2. Generate code (Hive adapters)
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Run the app
flutter run
```

See [SETUP_GUIDE.md](SETUP_GUIDE.md) for detailed setup instructions.

## Features (Planned)

### Phase 1: Core MVP ✅
- [x] Folder structure
- [x] Core data models
- [x] Dependencies setup
- [ ] Flame visual system (6 stages)
- [ ] Fuel calculation engine
- [ ] Challenge tier system (40-60 challenges)
- [ ] Basic UI (flame screen + challenge list)

### Phase 2: Banking & Widget
- [ ] Bank the Fire mechanic
- [ ] End-of-day reflection
- [ ] Home screen widget (critical!)

### Phase 3: AI Integration
- [ ] DeepSeek API integration
- [ ] AI-powered "why" discovery
- [ ] 10-message limit

### Phase 4: Polish & Animations
- [ ] Flame animations (6 stages)
- [ ] Fuel adding animations
- [ ] Death sequence
- [ ] Sound effects (optional)

### Phase 5: Release
- [ ] Google Play payment ($5 one-time)
- [ ] Beta testing
- [ ] Android release

## Philosophy

### No Second Chances
- Fuel hits 0 = You lose EVERYTHING
- No downgrades, no safety nets
- Tough love, Goggins philosophy

### Equal Difficulty at All Stages
- Spark: 3-4 small challenges daily
- Bonfire: 2 brutal challenges daily
- Same effort, different intensity

### Challenge Scaling
- Small flames unlock small rewards
- Big flames unlock big rewards
- Natural ceiling (Bonfire = genuinely extreme)

## Documentation

- **[PRODUCT_SPEC.md](PRODUCT_SPEC.md)** - Complete product specification
- **[SETUP_GUIDE.md](SETUP_GUIDE.md)** - Detailed setup instructions
- **[PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)** - Folder structure guide

## Development

### Run the app
```bash
flutter run
```

### Generate code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Run tests
```bash
flutter test
```

### Build release APK
```bash
flutter build apk --release
```

## Contributing

This is a personal project, but feedback is welcome! Open an issue if you find bugs or have suggestions.

## License

Proprietary - All rights reserved.

## Target

- **Platform**: Android (iOS later)
- **Price**: $5 one-time purchase
- **Launch**: 6-8 weeks from start

---

**Your flame is waiting.** 🔥
