# Flutter & Dart Laboratory Experiments (10 Experiments • 20 Modules)

[![Flutter](https://img.shields.io/badge/Flutter-3.24.0-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.5.0-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Web%20%7C%20Android%20%7C%20iOS%20%7C%20Desktop-4CAF50)]()
[![Commits](https://img.shields.io/badge/GitHub%20Commits-20%20Verified%20Milestones-blueviolet)]()

A comprehensive, production-grade Flutter and Dart laboratory suite encompassing **10 core experiments** divided into **20 discrete sub-modules**. Each module includes full source code, theoretical architecture, line-by-line breakdown, testing verification, and **high-fidelity website outputs** rendered for web browser viewports.

---


---

## Exp 1(a):



### 🌐 Output Preview
![Exp 1a Output](assets/outputs/exp1a_flutter_install.svg)

---

## Exp 1(b):

### 🌐 Output Preview
![Exp 1b Output](assets/outputs/exp1b_dart_basics.svg)

---

## Exp 2(a):

### 🌐 Output Preview
![Exp 2a Output](assets/outputs/exp2a_widgets.svg)

---

## Exp 2(b): 

### 🌐 Output Preview
![Exp 2b Output](assets/outputs/exp2b_layouts.svg)

---

## Exp 3(a): 

### 🌐 Output Preview
![Exp 3a Output](assets/outputs/exp3a_responsive.svg)

---

## Exp 3(b):

### 🌐 Output Preview
![Exp 3b Output](assets/outputs/exp3b_breakpoints.svg)

---

## Exp 4(a):

### 🌐 Output Preview
![Exp 4a Output](assets/outputs/exp4a_navigator.svg)

---

## Exp 4(b):

### 🌐 Output Preview
![Exp 4b Output](assets/outputs/exp4b_named_routes.svg)

---

## Exp 5(a): 

### 🌐 Output Preview
![Exp 5a Output](assets/outputs/exp5a_stateful.svg)

---

## Exp 5(b):

### 🌐 Output Preview
![Exp 5b Output](assets/outputs/exp5b_provider.svg)

---

## Exp 6(a):

### 🌐 Output Preview
![Exp 6a Output](assets/outputs/exp6a_custom_widgets.svg)

---

## Exp 6(b): 

### 🌐 Output Preview
![Exp 6b Output](assets/outputs/exp6b_themes.svg)

---

## Exp 7(a):

### 🌐 Output Preview
![Exp 7a Output](assets/outputs/exp7a_form_inputs.svg)

---

## Exp 7(b): 

### 🌐 Output Preview
![Exp 7b Output](assets/outputs/exp7b_form_validation.svg)

---

## Exp 8(a):

### 🌐 Output Preview
![Exp 8a Output](assets/outputs/exp8a_animation.svg)

---

## Exp 8(b):

### 🌐 Output Preview
![Exp 8b Output](assets/outputs/exp8b_fade_slide.svg)

---

## Exp 9(a): 

### 🌐 Output Preview
![Exp 9a Output](assets/outputs/exp9a_api_fetch.svg)

---

## Exp 9(b): 

### 🌐 Output Preview
![Exp 9b Output](assets/outputs/exp9b_api_ui.svg)

---

## Exp 10(a): 

### 🌐 Output Preview
![Exp 10a Output](assets/outputs/exp10a_unit_tests.svg)

---

## Exp 10(b): 

### 🌐 Output Preview
![Exp 10b Output](assets/outputs/exp10b_debugging_tools.svg)

---

## 🚀 How to Run the Laboratory Project

### Prerequisites
1. Flutter SDK `>= 3.24.0` and Dart SDK `>= 3.5.0` installed.
2. Web development enabled:
   ```bash
   flutter config --enable-web
   ```

### 1. Launch Interactive Web Showcase Application
The master Flutter Web app provides an interactive sidebar enabling live switching between all 20 experiment modules:

```bash
# Fetch pub dependencies
flutter pub get

# Run on Chrome Web Browser
flutter run -d chrome
```

### 2. Execute Standalone Dart Basics (Exp 1b)
```bash
dart run lib/experiments/exp1_dart_basics/dart_basics.dart
```

### 3. Run Automated Unit & Widget Test Suite (Exp 10a)
```bash
flutter test
```

---

## 📜 Complete 20-Commit Git History Log

| # | Commit Title | Experiment Covered | Module Focus |
| :---: | :--- | :---: | :--- |
| **01** | `Exp 1(a): Install Flutter and Dart SDK setup guide, automated script, and verification` | **Exp 1(a)** | SDK Setup & Toolchain (`flutter doctor`) |
| **02** | `Exp 1(b): Dart language basics - syntax, OOP inheritance, mixins, and async futures` | **Exp 1(b)** | Dart Basics & Object-Oriented Programming |
| **03** | `Exp 2(a): Explore core Flutter widgets - Text typography, Container decoration, and Image styling` | **Exp 2(a)** | Visual Building Blocks (Text, Image, Container) |
| **04** | `Exp 2(b): Implement layout structures using Row, Column, and Stack with Positioned overlays` | **Exp 2(b)** | Flex & Layered Alignment (Row, Column, Stack) |
| **05** | `Exp 3(a): Design responsive multi-device UI using LayoutBuilder and adaptive grids` | **Exp 3(a)** | Responsive Grid Layouts via `LayoutBuilder` |
| **06** | `Exp 3(b): Implement MediaQuery breakpoints for dynamic mobile, tablet, and desktop viewports` | **Exp 3(b)** | Breakpoint Rules & NavigationRail Adaptation |
| **07** | `Exp 4(a): Set up screen navigation using Navigator push and pop with data passing` | **Exp 4(a)** | Imperative Route Stack & Bi-directional Returns |
| **08** | `Exp 4(b): Implement declarative named routes navigation with argument routing and 404 page` | **Exp 4(b)** | Named Routes Table & `onGenerateRoute` |
| **09** | `Exp 5(a): Build Flutter screen combining StatelessWidget and StatefulWidget with dynamic UI counter updates` | **Exp 5(a)** | Immutable vs Mutable State & `setState()` |
| **10** | `Exp 5(b): Implement reactive state management using setState and Provider architecture` | **Exp 5(b)** | Global State with `ChangeNotifier` & `Consumer` |
| **11** | `Exp 6(a): Create reusable custom UI widgets including buttons, metric cards, and badge avatars` | **Exp 6(a)** | Custom Atomic Components (DRY Principles) |
| **12** | `Exp 6(b): Apply application-wide styling with Material 3 ThemeData and light/dark mode switcher` | **Exp 6(b)** | Dynamic Material 3 Theming & ColorSchemes |
| **13** | `Exp 7(a): Design comprehensive form with text fields, dropdowns, switches, radio, sliders, and date picker` | **Exp 7(a)** | Diverse Form Input Controls & Controllers |
| **14** | `Exp 7(b): Implement robust form validation with regex, error styling, and dialog submission handler` | **Exp 7(b)** | `FormState` Validation, Regex & Inline Errors |
| **15** | `Exp 8(a): Add UI animations using Flutter AnimationController, CurvedAnimation, and AnimatedBuilder` | **Exp 8(a)** | Explicit Animations & Easing Curves |
| **16** | `Exp 8(b): Implement multi-type animation transitions with FadeTransition, SlideTransition, and ScaleTransition` | **Exp 8(b)** | Multi-Type Transitions Choreography |
| **17** | `Exp 9(a): Fetch data from REST API with HTTP service, Post model, and serialization` | **Exp 9(a)** | Asynchronous HTTP Networking & Deserialization |
| **18** | `Exp 9(b): Display REST API data meaningfully with FutureBuilder, loading skeletons, and error handling` | **Exp 9(b)** | Reactive UI Future Mapping & Search Filters |
| **19** | `Exp 10(a): Write automated unit tests and widget tests for UI components with pump and assertions` | **Exp 10(a)** | Automated Testing with `flutter_test` |
| **20** | `Exp 10(b): Implement Flutter debugging tools demo, DevTools guide, interactive showcase app, and complete README documentation` | **Exp 10(b)** | DevTools Inspector, Issue Fixing & Master Web Portal |

---

## 📁 Repository Directory Structure

```text
flutter_lab_experiments/
├── assets/
│   └── outputs/                 # 20 High-Fidelity Website Output Vector Graphics
│       ├── exp1a_flutter_install.svg
│       ├── exp1b_dart_basics.svg
│       ├── exp2a_widgets.svg
│       ├── exp2b_layouts.svg
│       ├── exp3a_responsive.svg
│       ├── exp3b_breakpoints.svg
│       ├── exp4a_navigator.svg
│       ├── exp4b_named_routes.svg
│       ├── exp5a_stateful.svg
│       ├── exp5b_provider.svg
│       ├── exp6a_custom_widgets.svg
│       ├── exp6b_themes.svg
│       ├── exp7a_form_inputs.svg
│       ├── exp7b_form_validation.svg
│       ├── exp8a_animation.svg
│       ├── exp8b_fade_slide.svg
│       ├── exp9a_api_fetch.svg
│       ├── exp9b_api_ui.svg
│       ├── exp10a_unit_tests.svg
│       └── exp10b_debugging_tools.svg
├── docs/
│   ├── exp1a_setup_guide.md     # Installation & PATH configuration manual
│   └── debugging_guide.md       # Flutter DevTools, Profiler & bug resolution manual
├── lib/
│   ├── experiments/
│   │   ├── exp1_dart_basics/
│   │   │   └── dart_basics.dart
│   │   ├── exp2_widgets_layouts/
│   │   │   ├── exp2a_widgets.dart
│   │   │   └── exp2b_layouts.dart
│   │   ├── exp3_responsive/
│   │   │   ├── exp3a_responsive_ui.dart
│   │   │   └── exp3b_media_queries.dart
│   │   ├── exp4_navigation/
│   │   │   ├── exp4a_navigator.dart
│   │   │   └── exp4b_named_routes.dart
│   │   ├── exp5_state_management/
│   │   │   ├── exp5a_stateful_stateless.dart
│   │   │   └── exp5b_provider_state.dart
│   │   ├── exp6_custom_styling/
│   │   │   ├── exp6a_custom_widgets.dart
│   │   │   └── exp6b_themes_styling.dart
│   │   ├── exp7_forms/
│   │   │   ├── exp7a_form_inputs.dart
│   │   │   └── exp7b_form_validation.dart
│   │   ├── exp8_animations/
│   │   │   ├── exp8a_basic_animation.dart
│   │   │   └── exp8b_fade_slide_animation.dart
│   │   ├── exp9_api/
│   │   │   ├── exp9a_api_service.dart
│   │   │   └── exp9b_api_ui.dart
│   │   └── exp10_testing_debugging/
│   │       └── debugging_demo.dart
│   └── main.dart                # Master Web Portal with Sidebar Navigation
├── scripts/
│   └── install_flutter.ps1      # Automated PowerShell installer for Windows
├── test/
│   ├── unit_test.dart           # Business logic & model unit tests
│   └── widget_test.dart         # UI widget lifecycle & interaction tests
├── web/
│   ├── index.html               # Web bootstrap entrypoint
│   └── manifest.json            # PWA manifest
├── pubspec.yaml                 # Dependencies (provider, http, intl, flutter_test)
└── README.md                    # Publication-Grade Master Documentation
```

---
*Created by Rupali Singh for Mobile Application Development Laboratory.*
