# Product Application

A Flutter app for browsing products, viewing product details, managing favorites, and adding products to the local list.

## Setup and Run

Prerequisites:

- Flutter SDK with Dart 3.11.5 or later
- An Android emulator, iOS simulator, or connected device

Install dependencies and run the app:

```bash
flutter pub get
flutter run
```

Run the analyzer and tests:

```bash
flutter analyze
flutter test
```

## Packages and API

- [`provider`](https://pub.dev/packages/provider) for state management
- [`http`](https://pub.dev/packages/http) for network requests
- [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) for iOS-style icons
- [`proviso`](https://pub.dev/packages/proviso), included as a project dependency
- [DummyJSON Products API](https://dummyjson.com/docs/products) for fetching and adding products

The app reads products from `https://dummyjson.com/products` and posts new products to `/products/add`. DummyJSON is a test API, so changes are not persisted permanently.
# assignment-productApp
