## Ecommerce App (Flutter + Redux)

Modern Flutter ecommerce demo showcasing clean architecture, Redux state management, typed domain/use cases, and navigation with GoRouter. Data is fetched from the public Fake Store API.

### Tech stack
- **Flutter** (Material 3-ready UI)
- **Redux** via `flutter_redux`, `redux`, `redux_thunk`
- **GoRouter** for navigation
- **Dio** + lightweight REST client
- **Dartz** (Either for domain results)
- **Equatable**, **Shimmer**

### Features
- Products list with pull-to-refresh
- Product details page
- Categories filter (client-side)
- Light/Dark theme toggle

### Architecture
The project follows a layered, feature-first clean architecture:
- `feature/<domain>` split into `data`, `domain`, `presentation`
- `core/` contains cross-cutting concerns (network, redux, router, theme)

State management is handled via Redux:
- `core/redux/app_state.dart`: single app state
- `core/redux/*_state.dart`: feature slices (theme, categories, products, product_detail)
- `core/redux/*_actions.dart`: actions and thunks
- `core/redux/*_reducer.dart`: pure reducers
- `core/redux/store.dart`: store factory (with thunk middleware)

Navigation:
- `core/router/router_config.dart` exposes a single `appRouter` used by `MaterialApp.router`

Network & DI:
- `core/network/network.dart` defines a shared `appRestClient`
- `core/di/di.dart` wires data sources, repositories, and use cases without runtime DI frameworks

### Project structure (excerpt)
```
lib/
  core/
    di/
    network/
    redux/
      theme/ | categories/ | products/ | product_detail/
    router/
  feature/
    category/
    product/
      products/ (list)
      details/ (detail)
  main.dart
```

### Getting started
1) Prerequisites
- Flutter SDK installed and configured
- iOS: Xcode set up; Android: Android Studio/SDK

2) Install dependencies
```bash
flutter pub get
```

3) Run
```bash
# iOS Simulator
flutter run -d ios

# Android Emulator
flutter run -d android

# Web (optional)
flutter run -d chrome
```

### How Redux is wired
- The store is created in `core/redux/store.dart` and provided at the root in `main.dart` via `StoreProvider`.
- Screens use `StoreConnector` to subscribe to state slices and dispatch actions.
- Async work (fetching categories/products/details) is done in thunks from `*_actions.dart` using `redux_thunk`.

Key files
- `lib/main.dart`: App entry, `StoreProvider`, theme binding, `MaterialApp.router`
- `lib/core/redux/...`: Redux store, reducers, actions, states
- `lib/core/router/router_config.dart`: App routes
- `lib/core/di/di.dart`: Use case construction

### APIs
- Fake Store API: `https://fakestoreapi.com/`

### Notes
- Category filtering is client-side against the loaded product list.
- Error states are rendered as simple `Center(Text('Error'))` placeholders—extend as needed.

### License
MIT (or your preferred license)


