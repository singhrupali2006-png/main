# Flutter & Dart Laboratory Experiments (10 Experiments • 20 Modules)

[![Flutter](https://img.shields.io/badge/Flutter-3.24.0-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.5.0-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Web%20%7C%20Android%20%7C%20iOS%20%7C%20Desktop-4CAF50)]()
[![Commits](https://img.shields.io/badge/GitHub%20Commits-20%20Verified%20Milestones-blueviolet)]()

A comprehensive, production-grade Flutter and Dart laboratory suite encompassing **10 core experiments** divided into **20 discrete sub-modules**. Each module includes full source code, theoretical architecture, line-by-line breakdown, testing verification, and **high-fidelity website outputs** rendered for web browser viewports.

---

## 📑 Table of Contents

| Experiment | Title | Description | Sub-Modules |
| :--- | :--- | :--- | :--- |
| **Exp 1** | **SDK Setup & Dart Basics** | Installation, toolchain verification, and Dart language fundamentals | [1(a)](#exp-1a-install-flutter-and-dart-sdk) • [1(b)](#exp-1b-dart-language-basics) |
| **Exp 2** | **Core Widgets & Layouts** | Text, Image, Container, Row, Column, and Stack positioning | [2(a)](#exp-2a-explore-flutter-widgets-text-image-container) • [2(b)](#exp-2b-implement-layouts-row-column-stack) |
| **Exp 3** | **Responsive Design** | Dynamic UI layout adaptations and MediaQuery breakpoint engines | [3(a)](#exp-3a-responsive-ui-design) • [3(b)](#exp-3b-media-queries-and-breakpoints) |
| **Exp 4** | **Navigation & Routing** | Imperative Navigator routing and declarative named routes with arguments | [4(a)](#exp-4a-navigation-between-screens) • [4(b)](#exp-4b-navigation-with-named-routes) |
| **Exp 5** | **Widget State & Provider** | StatelessWidget vs StatefulWidget and reactive Provider state management | [5(a)](#exp-5a-statelesswidget-and-statefulwidget) • [5(b)](#exp-5b-state-management-with-setstate-and-provider) |
| **Exp 6** | **Custom Widgets & Theming**| Reusable modular UI elements and Material 3 theme customization | [6(a)](#exp-6a-custom-widgets) • [6(b)](#exp-6b-themes-and-custom-styling) |
| **Exp 7** | **Interactive Forms** | Complex inputs, regex validation, and error handling | [7(a)](#exp-7a-form-with-various-input-fields) • [7(b)](#exp-7b-form-validation-and-error-handling) |
| **Exp 8** | **Animations Framework** | Explicit animation controllers, tween curves, fade, and slide transitions | [8(a)](#exp-8a-ui-animations-framework) • [8(b)](#exp-8b-fade-and-slide-transitions) |
| **Exp 9** | **REST API Integration** | HTTP client networking, JSON serialization, and FutureBuilder UI | [9(a)](#exp-9a-fetch-data-from-rest-api) • [9(b)](#exp-9b-display-fetched-data-in-ui) |
| **Exp 10** | **Testing & Debugging** | Unit & widget tests, DevTools profiling, and issue resolution | [10(a)](#exp-10a-unit-tests-for-ui-components) • [10(b)](#exp-10b-flutter-debugging-tools) |

---

## Exp 1(a): Install Flutter and Dart SDK

### 🎯 Objective
Set up the Flutter and Dart SDK development environment on the local machine, configure environment variables (`PATH`), configure web target platform, and verify setup integrity using `flutter doctor`.

### 🛠️ Key Concepts
- **Flutter SDK**: Portable UI toolkit for compiling natively to Web (CanvasKit/HTML), Android, iOS, Windows, macOS, and Linux.
- **Dart SDK**: Standalone virtual machine, AOT compiler, and standard library powering Flutter.
- **`flutter doctor`**: Diagnostic tool that validates local toolchain dependencies (Android SDK, Chrome browser, Visual Studio toolchain, IDE plugins).

### 💻 Execution & Verification Commands
```bash
# 1. Automated installation via script (Windows PowerShell)
.\scripts\install_flutter.ps1

# 2. Check installed versions
flutter --version
dart --version

# 3. Comprehensive diagnostic check
flutter doctor -v
```

### 🌐 Output Preview
![Exp 1a Output](assets/outputs/exp1a_flutter_install.svg)

---

## Exp 1(b): Dart Language Basics

### 🎯 Objective
Understand core syntax and language constructs of Dart, including strong typing, type inference, control flow structures, functional parameters, mixins, object-oriented principles (inheritance, encapsulation), and asynchronous `Future` programming.

### 🛠️ Key Concepts
- **Type Safety & Sound Null Safety**: Static type checking prevents runtime null reference errors.
- **Object-Oriented Programming**: Everything in Dart is an object inheriting from `Object?`. Supports single inheritance and composition via Mixins (`with LoggerMixin`).
- **Encapsulation**: Leading underscore `_gpa` creates library-private fields with getter/setter control.
- **Asynchronous Primitives**: `Future`, `async`, and `await` handle non-blocking asynchronous operations.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp1_dart_basics/dart_basics.dart`](lib/experiments/exp1_dart_basics/dart_basics.dart)

```dart
// Snippet: Mixin & OOP Inheritance in Dart
mixin LoggerMixin {
  void log(String message) => print('[LOG] $message');
}

class Student extends Person with LoggerMixin {
  final String studentId;
  double _gpa;

  Student({required super.name, required super.age, required this.studentId, double initialGpa = 3.8})
      : _gpa = initialGpa;

  double get gpa => _gpa;
  set gpa(double value) {
    if (value >= 0.0 && value <= 4.0) _gpa = value;
  }
}
```

### 🌐 Output Preview
![Exp 1b Output](assets/outputs/exp1b_dart_basics.svg)

---

## Exp 2(a): Explore Flutter Widgets (Text, Image, Container)

### 🎯 Objective
Explore foundational visual building blocks in Flutter: `Text` typography with rich text spans, `Image` asset and network loading with error/placeholder builders, and `Container` styling using `BoxDecoration`, borders, gradients, and elevation shadows.

### 🛠️ Key Concepts
- **`Container`**: Convenience widget combining padding, margins, borders, background gradients, constraints, and matrix transformations.
- **`BoxDecoration`**: Encapsulates painting instructions including `LinearGradient`, `BorderRadius`, `BoxShadow`, and `Border`.
- **`Text` & `RichText`**: Flexible text rendering with inline spans (`TextSpan`), custom letter spacing, shadows, and overflow handling (`TextOverflow.ellipsis`).
- **`Image` & Clipping**: Network asset fetching with graceful `loadingBuilder`, `errorBuilder`, and shape clipping via `ClipRRect` and `CircleAvatar`.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp2_widgets_layouts/exp2a_widgets.dart`](lib/experiments/exp2_widgets_layouts/exp2a_widgets.dart)

```dart
// Snippet: Decorated Container with ClipRRect and RichText
Container(
  padding: const EdgeInsets.all(20.0),
  decoration: BoxDecoration(
    gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)]),
    borderRadius: BorderRadius.circular(16.0),
    boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
  ),
  child: Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: Image.network('https://picsum.photos/seed/flutter2a/200', fit: BoxFit.cover),
      ),
      const SizedBox(width: 20),
      Expanded(
        child: Text('Container & RichText Showcase', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    ],
  ),
);
```

### 🌐 Output Preview
![Exp 2a Output](assets/outputs/exp2a_widgets.svg)

---

## Exp 2(b): Implement Layouts (Row, Column, Stack)

### 🎯 Objective
Master structural layout paradigms in Flutter by arranging widgets linearly along horizontal (`Row`) and vertical (`Column`) axes, controlling flex factors (`Expanded`, `Flexible`), and compositing overlapping Z-index layers using `Stack` and `Positioned`.

### 🛠️ Key Concepts
- **`Row` & `Column`**: Linear layout engines. Control main and cross axis alignment via `MainAxisAlignment` (start, center, spaceBetween, spaceEvenly) and `CrossAxisAlignment`.
- **`Expanded` vs `Flexible`**: `Expanded` forces a child to fill the remaining flex space, whereas `Flexible` allows a child to resize up to that boundary without occupying redundant room.
- **`Stack` & `Positioned`**: Multi-layered widget ordering where later children render on top of earlier children. `Positioned` establishes absolute pin offsets (`top`, `bottom`, `left`, `right`).

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp2_widgets_layouts/exp2b_layouts.dart`](lib/experiments/exp2_widgets_layouts/exp2b_layouts.dart)

```dart
// Snippet: Layered Stack with Positioned Tag and Banner
Stack(
  children: [
    Container(height: 180, decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.teal.shade800, Colors.teal.shade400]))),
    Positioned(
      top: 14,
      right: 14,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(color: Colors.amber.shade400, borderRadius: BorderRadius.circular(20)),
        child: const Text('FEATURED', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
      ),
    ),
    Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(color: Colors.black.withOpacity(0.55), padding: const EdgeInsets.all(14), child: Text('Layered Card', style: TextStyle(color: Colors.white))),
    ),
  ],
)
```

### 🌐 Output Preview
![Exp 2b Output](assets/outputs/exp2b_layouts.svg)

---

## Exp 3(a): Responsive UI Design

### 🎯 Objective
Design a multi-device responsive user interface utilizing `LayoutBuilder` and constraint calculations to adapt layouts seamlessly between mobile (single column), tablet (two columns), and desktop/web viewports (three columns).

### 🛠️ Key Concepts
- **`LayoutBuilder`**: Provides parent `BoxConstraints` to calculate dynamic layout structures at runtime during widget layout phase.
- **Adaptive Grid**: Dynamically sets `crossAxisCount` based on width breakpoints (`constraints.maxWidth >= 950 ? 3 : 2 : 1`).
- **Flexible Dimensions**: Utilizes `mainAxisExtent` and flexible padding to prevent render overflows (`A RenderFlex overflowed by ... pixels`).

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp3_responsive/exp3a_responsive_ui.dart`](lib/experiments/exp3_responsive/exp3a_responsive_ui.dart)

```dart
// Snippet: Responsive Column Assignment with LayoutBuilder
LayoutBuilder(
  builder: (context, constraints) {
    int crossAxisCount = 1;
    if (constraints.maxWidth >= 950) {
      crossAxisCount = 3;
    } else if (constraints.maxWidth >= 600) {
      crossAxisCount = 2;
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 160,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => MetricCard(item: items[index]),
    );
  },
)
```

### 🌐 Output Preview
![Exp 3a Output](assets/outputs/exp3a_responsive.svg)

---

## Exp 3(b): Media Queries and Breakpoints

### 🎯 Objective
Implement adaptive responsive layouts using `MediaQuery` data to query screen geometry, pixel density, orientation, and establish responsive breakpoints that dynamically swap UI components (e.g., `NavigationRail` for desktop/tablet vs `NavigationBar` for mobile).

### 🛠️ Key Concepts
- **`MediaQuery.of(context)`**: Supplies device physical dimensions, orientation (`Orientation.portrait` / `Orientation.landscape`), and system inset paddings.
- **Breakpoint Tiers**:
  - **Mobile**: `< 600 dp` &rarr; Bottom navigation bar, full-width cards.
  - **Tablet**: `600 dp - 1023 dp` &rarr; Compact sidebar rail, dual column.
  - **Desktop / Web**: `>= 1024 dp` &rarr; Extended navigation rail, multi-pane dashboard.
- **Adaptive Scaffolding**: Dynamically injects navigation widgets according to active viewport width.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp3_responsive/exp3b_media_queries.dart`](lib/experiments/exp3_responsive/exp3b_media_queries.dart)

```dart
// Snippet: Adaptive Scaffolding with MediaQuery Breakpoint
final width = MediaQuery.of(context).size.width;
final isMobile = width < 600;

return Scaffold(
  bottomNavigationBar: isMobile ? NavigationBar(destinations: destinations) : null,
  body: Row(
    children: [
      if (!isMobile) NavigationRail(destinations: railDestinations, selectedIndex: selectedIdx),
      Expanded(child: ResponsiveDashboardContent()),
    ],
  ),
);
```

### 🌐 Output Preview
![Exp 3b Output](assets/outputs/exp3b_breakpoints.svg)

---

## Exp 4(a): Navigation Between Screens (Navigator)

### 🎯 Objective
Configure imperative screen transitions using Flutter's `Navigator` stack architecture (`Navigator.push` and `Navigator.pop`), pass dynamic data parameters from a source route to a destination route, and handle return callbacks asynchronously using `await`.

### 🛠️ Key Concepts
- **Route Stack**: LIFO (Last-In-First-Out) stack structure managed by `NavigatorState`.
- **`MaterialPageRoute`**: Platform-adaptive route that transitions with slide animations on iOS/Android and fade transitions on Web.
- **Bi-Directional Data Transfer**:
  - Arguments supplied directly via destination class constructors.
  - Return data passed back via `Navigator.pop(context, result)` and handled in `final result = await Navigator.push(...)`.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp4_navigation/exp4a_navigator.dart`](lib/experiments/exp4_navigation/exp4a_navigator.dart)

```dart
// Snippet: Pushing Route and Awaiting Return Value
final result = await Navigator.push<String>(
  context,
  MaterialPageRoute(
    builder: (context) => const DetailScreen(
      itemId: 'ITEM-9042',
      itemName: 'Flutter Web Cloud Engine',
      price: 49.99,
    ),
  ),
);

// Returning value inside DetailScreen:
Navigator.pop(context, 'Confirmed Purchase of ITEM-9042');
```

### 🌐 Output Preview
![Exp 4a Output](assets/outputs/exp4a_navigator.svg)

---

## Exp 4(b): Navigation with Named Routes

### 🎯 Objective
Implement structured, declarative routing across the Flutter application utilizing a central named routes table, dynamic route resolution via `onGenerateRoute`, type-safe argument deserialization, and wildcard 404 error routing.

### 🛠️ Key Concepts
- **`routes` Table**: Map of string path keys (`'/'`, `'/settings'`) to `WidgetBuilder` factory closures.
- **`onGenerateRoute`**: Intercepts navigation transitions dynamically to inspect `RouteSettings.name` and unpack strongly-typed argument payloads (`RouteSettings.arguments as UserProfileArgs`).
- **Web URL Synchronization**: In Flutter Web, named route paths seamlessly map to browser hash fragments (e.g. `#/profile`).
- **404 Fallback**: Guarantees graceful degradation if users access undefined or obsolete URLs.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp4_navigation/exp4b_named_routes.dart`](lib/experiments/exp4_navigation/exp4b_named_routes.dart)

```dart
// Snippet: Declarative Routing & onGenerateRoute Dispatcher
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const HomeScreen(),
    '/settings': (context) => const SettingsScreen(),
  },
  onGenerateRoute: (settings) {
    if (settings.name == '/profile') {
      final args = settings.arguments as UserProfileArgs;
      return MaterialPageRoute(builder: (context) => ProfileScreen(args: args));
    }
    return MaterialPageRoute(builder: (context) => const NotFoundScreen());
  },
);
```

### 🌐 Output Preview
![Exp 4b Output](assets/outputs/exp4b_named_routes.svg)

---

## Exp 5(a): StatelessWidget and StatefulWidget

### 🎯 Objective
Create a cohesive Flutter screen featuring both `StatelessWidget` and `StatefulWidget` architectures. Implement interactive buttons that manipulate internal state values and demonstrate how `setState()` triggers widget subtree rebuilds.

### 🛠️ Key Concepts
- **`StatelessWidget`**: Immutable component with no mutable state across rebuilds (`const StatelessInfoBanner(...)`).
- **`StatefulWidget` & `State<T>`**: Separates the immutable widget definition from its persistent `State` lifecycle object.
- **`setState(() { ... })`**: Marks the widget's `Element` as dirty and schedules a repaint/rebuild with the new state variables.
- **Lifecycle Methods**: `initState()`, `build()`, and `dispose()`.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp5_state_management/exp5a_stateful_stateless.dart`](lib/experiments/exp5_state_management/exp5a_stateful_stateless.dart)

```dart
// Snippet: setState() triggering dynamic UI updates
void _modifyValue(int delta) {
  setState(() {
    _counter += (delta * _step);
    _rebuildCount++;
  });
}

@override
Widget build(BuildContext context) {
  return Text('$_counter', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold));
}
```

### 🌐 Output Preview
![Exp 5a Output](assets/outputs/exp5a_stateful.svg)

---

## Exp 5(b): State Management with setState and Provider

### 🎯 Objective
Contrast local ephemeral widget state management (`setState`) against global scalable state management utilizing `ChangeNotifier` and the `provider` package. Build a reactive shopping cart store that propagates updates across disparate subtree components.

### 🛠️ Key Concepts
- **Ephemeral State (`setState`)**: Suitable for self-contained UI state (e.g. current tab selection, checkbox toggle, animations). Does not scale across disconnected routes.
- **App State (`Provider`)**: Decouples business logic into an observable domain model (`class CartNotifier extends ChangeNotifier`).
- **`ChangeNotifierProvider`**: Injects models down the widget tree using `InheritedWidget` semantics without manual prop-drilling.
- **`Consumer<T>` & `context.read<T>()`**: `Consumer` re-renders only its immediate descendant tree when `notifyListeners()` fires, avoiding expensive root redraws.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp5_state_management/exp5b_provider_state.dart`](lib/experiments/exp5_state_management/exp5b_provider_state.dart)

```dart
// Snippet: ChangeNotifier Store and Consumer Usage
class CartNotifier extends ChangeNotifier {
  final List<ProductItem> _items = [];
  int get itemCount => _items.length;

  void addItem(ProductItem item) {
    _items.add(item);
    notifyListeners(); // Broadcasts updates to all active Consumers
  }
}

// In Widget Tree:
Consumer<CartNotifier>(
  builder: (context, cart, child) {
    return Text('Cart: ${cart.itemCount} items');
  },
);
```

### 🌐 Output Preview
![Exp 5b Output](assets/outputs/exp5b_provider.svg)

---

## Exp 6(a): Custom Widgets

### 🎯 Objective
Architect modular, testable, and reusable custom Flutter widgets to promote DRY (Don't Repeat Yourself) design principles, parameterizing visual tokens, icons, typography, and event closures across atomic components.

### 🛠️ Key Concepts
- **Component Decomposition**: Extracting repeated visual hierarchies into dedicated `StatelessWidget` / `StatefulWidget` classes.
- **Custom Composited Elements**:
  - `CustomAvatarBadge`: User avatar with presence dot overlaid via `Stack` & `Positioned`.
  - `CustomMetricCard`: Analytics card encapsulating delta indicators, color tokens, and elevation.
  - `CustomGradientButton`: Touch-reactive button with ink ripples (`InkWell`) and multi-stop linear gradients.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp6_custom_styling/exp6a_custom_widgets.dart`](lib/experiments/exp6_custom_styling/exp6a_custom_widgets.dart)

```dart
// Snippet: Custom Reusable Gradient Button
class CustomGradientButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final List<Color> gradientColors;
  final VoidCallback onPressed;

  const CustomGradientButton({super.key, required this.text, required this.icon, required this.gradientColors, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradientColors),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: gradientColors.first.withOpacity(0.35), blurRadius: 10)],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14), child: Text(text, style: const TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}
```

### 🌐 Output Preview
![Exp 6a Output](assets/outputs/exp6a_custom_widgets.svg)

---

## Exp 6(b): Themes and Custom Styling

### 🎯 Objective
Establish an application-wide design system utilizing Material 3 `ThemeData`, seed colors, custom component themes (`ElevatedButtonThemeData`, `CardTheme`), and a runtime dynamic Light/Dark mode switcher.

### 🛠️ Key Concepts
- **`ThemeData` & Material 3**: Generates a tonal palette of 30+ accessible semantic color tokens (surface, onSurface, primaryContainer) derived from a single `colorSchemeSeed`.
- **Dynamic Theme Mode**: `ThemeMode.system`, `ThemeMode.light`, or `ThemeMode.dark` toggled via `setState()`.
- **Inherited Theme Context**: Accessing styles programmatically via `Theme.of(context).colorScheme.primary` ensures automatic repainting upon mode alteration.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp6_custom_styling/exp6b_themes_styling.dart`](lib/experiments/exp6_custom_styling/exp6b_themes_styling.dart)

```dart
// Snippet: Material 3 Theming Setup
MaterialApp(
  themeMode: _themeMode,
  theme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.deepPurple,
  ),
  darkTheme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.deepPurple,
    scaffoldBackgroundColor: const Color(0xFF0F172A),
  ),
  home: const ThemesHomeScreen(),
);
```

### 🌐 Output Preview
![Exp 6b Output](assets/outputs/exp6b_themes.svg)

---

## Exp 7(a): Form with Various Input Fields

### 🎯 Objective
Design a multi-field input interface utilizing Flutter form components: text input fields with obscured characters, dropdown option pickers, numeric slider selectors, binary toggle switches, radio button groups, and checkbox agreements.

### 🛠️ Key Concepts
- **`Form` & `TextEditingController`**: Coordinates form validation cycles and manages live controller subscriptions to text mutations.
- **Input Controls**:
  - `TextFormField`: Multi-type text inputs supporting obscure passwords, auto-correct, and input formatters.
  - `DropdownButtonFormField`: Select menus with custom option values.
  - `Slider`: Continuous/discrete numeric value pickers.
  - `SwitchListTile`, `RadioListTile`, `CheckboxListTile`: Boolean and enumerated selection widgets with built-in accessibility labels.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp7_forms/exp7a_form_inputs.dart`](lib/experiments/exp7_forms/exp7a_form_inputs.dart)

```dart
// Snippet: Diverse Form Inputs Setup
Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(controller: _emailController, keyboardType: TextInputType.emailAddress),
      DropdownButtonFormField<String>(value: _selectedRole, items: _roles.map(...).toList()),
      Slider(value: _experienceYears, min: 0, max: 15, onChanged: (v) => setState(() => _experienceYears = v)),
      SwitchListTile(title: const Text('Notifications'), value: _notificationsEnabled, onChanged: ...),
      CheckboxListTile(title: const Text('Accept Terms'), value: _termsAccepted, onChanged: ...),
    ],
  ),
);
```

### 🌐 Output Preview
![Exp 7a Output](assets/outputs/exp7a_form_inputs.svg)

---

## Exp 7(b): Form Validation and Error Handling

### 🎯 Objective
Implement client-side validation logic using `GlobalKey<FormState>`, enforcing regular expression email validation, password complexity constraints, and displaying reactive inline error hints with red visual cues upon invalid submissions.

### 🛠️ Key Concepts
- **`GlobalKey<FormState>`**: Provides direct access to the `FormState` element to trigger `validate()`, `save()`, or `reset()`.
- **Validation Callbacks (`validator`)**: Return `null` when input is valid, or a descriptive `String` error when constraints fail.
- **`AutovalidateMode.onUserInteraction`**: Automatically re-evaluates rules on every keystroke after initial user interaction or first submit attempt.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp7_forms/exp7b_form_validation.dart`](lib/experiments/exp7_forms/exp7b_form_validation.dart)

```dart
// Snippet: Email Regex Validation
TextFormField(
  controller: _emailController,
  decoration: const InputDecoration(labelText: 'Email Address'),
  validator: (value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  },
);

// Triggering validation:
if (_formKey.currentState!.validate()) {
  // Succeeded
}
```

### 🌐 Output Preview
![Exp 7b Output](assets/outputs/exp7b_form_validation.svg)

---

## Exp 8(a): UI Animations Framework

### 🎯 Objective
Construct explicit animations using Flutter’s `AnimationController`, configure easing curves with `CurvedAnimation`, and optimize rendering efficiency using `AnimatedBuilder` to manipulate scale, rotation, and elevation without whole-tree rebuilds.

### 🛠️ Key Concepts
- **`SingleTickerProviderStateMixin`**: Binds the animation controller to the device display refresh rate (~60/120 Hz) via a `Ticker`.
- **`AnimationController`**: Controls playback state (`forward()`, `reverse()`, `repeat()`, `stop()`) over specified durations.
- **`CurvedAnimation`**: Applies non-linear easing mathematics (`Curves.easeInOutCubic`).
- **`AnimatedBuilder`**: Re-executes only its specific `builder` callback on tick notifications, keeping parent widget trees static.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp8_animations/exp8a_basic_animation.dart`](lib/experiments/exp8_animations/exp8a_basic_animation.dart)

```dart
// Snippet: Animation Controller & AnimatedBuilder Setup
_controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));
final curved = CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic);
_scaleAnimation = Tween<double>(begin: 0.85, end: 1.15).animate(curved);

AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return Transform.scale(
      scale: _scaleAnimation.value,
      child: Container(width: 120, height: 120, decoration: BoxDecoration(borderRadius: BorderRadius.circular(28))),
    );
  },
);
```

### 🌐 Output Preview
![Exp 8a Output](assets/outputs/exp8a_animation.svg)

---

## Exp 8(b): Fade and Slide Transitions

### 🎯 Objective
Experiment with diverse core animation transition widgets: `FadeTransition`, `SlideTransition`, `ScaleTransition`, and `RotationTransition`, manipulating interpolation intervals and directional vectors across choreographed UI cards.

### 🛠️ Key Concepts
- **`FadeTransition`**: Animates the opacity of a child widget using `Animation<double>` bound between `0.0` and `1.0`.
- **`SlideTransition`**: Translates a widget relative to its normal coordinate system using `Tween<Offset>`.
- **`ScaleTransition` & `RotationTransition`**: Transforms visual scale factors and angular turns (`0.0` to `1.0` representing a complete $360^\circ$ circle).
- **Composite Animation Sequences**: Running multiple tween streams against a single master `AnimationController`.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp8_animations/exp8b_fade_slide_animation.dart`](lib/experiments/exp8_animations/exp8b_fade_slide_animation.dart)

```dart
// Snippet: SlideTransition and FadeTransition Setup
_slideAnimation = Tween<Offset>(
  begin: const Offset(0.0, 0.4),
  end: Offset.zero,
).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

_fadeAnimation = Tween<double>(begin: 0.1, end: 1.0).animate(_controller);

// In Widget Tree:
SlideTransition(
  position: _slideAnimation,
  child: FadeTransition(
    opacity: _fadeAnimation,
    child: MetricBadgeCard(),
  ),
);
```

### 🌐 Output Preview
![Exp 8b Output](assets/outputs/exp8b_fade_slide.svg)

---

## Exp 9(a): Fetch Data from a REST API

### 🎯 Objective
Architect an asynchronous networking service layer using the `http` package, querying public REST API endpoints (`GET /posts`), parsing structured JSON payloads into strongly typed Dart model objects (`Post.fromJson`), and engineering offline fallback resilience.

### 🛠️ Key Concepts
- **`http.Client`**: Executes asynchronous HTTP calls returning `Future<http.Response>`.
- **JSON Serialization**: Decodes raw string responses via `dart:convert` (`json.decode(response.body)`).
- **Model Deserialization**: Factory constructors (`factory Post.fromJson(Map<String, dynamic> json)`) ensure immutable and null-safe property assignment.
- **Resilient Fallback**: Catches network/timeout exceptions and returns local fallback schemas, guaranteeing test pass rates in offline sandbox environments.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp9_api/exp9a_api_service.dart`](lib/experiments/exp9_api/exp9a_api_service.dart)

```dart
// Snippet: REST API Service & Factory Deserializer
class Post {
  final int id;
  final String title;
  final String body;

  const Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'] as int? ?? 0,
        title: json['title'] as String? ?? 'Untitled',
        body: json['body'] as String? ?? '',
      );
}

Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=10'));
  if (response.statusCode == 200) {
    final List list = json.decode(response.body);
    return list.map((e) => Post.fromJson(e)).toList();
  }
  throw ApiException('Failed to load posts', response.statusCode);
}
```

### 🌐 Output Preview
![Exp 9a Output](assets/outputs/exp9a_api_fetch.svg)

---

## Exp 9(b): Display Fetched Data in the UI

### 🎯 Objective
Consume asynchronous streams and futures utilizing `FutureBuilder<List<Post>>` to build a reactive UI that smoothly renders distinct states: loading spinner, network error retry dialog, dynamic search filter, and list cards with pull-to-refresh (`RefreshIndicator`).

### 🛠️ Key Concepts
- **`FutureBuilder` Lifecycle**: Inspects `snapshot.connectionState` (none, waiting, active, done) and `snapshot.hasError` before accessing `snapshot.data`.
- **`RefreshIndicator`**: Implements pull-to-refresh physics calling async refresh dispatchers.
- **Client-Side Filtering**: Reactive substring search filtering without unnecessary network roundtrips.

### 💻 Dart Source Code Reference
File: [`lib/experiments/exp9_api/exp9b_api_ui.dart`](lib/experiments/exp9_api/exp9b_api_ui.dart)

```dart
// Snippet: FutureBuilder with ConnectionState Handling
FutureBuilder<List<Post>>(
  future: _postsFuture,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }
    final posts = snapshot.data ?? [];
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostCard(post: posts[index]),
    );
  },
);
```

### 🌐 Output Preview
![Exp 9b Output](assets/outputs/exp9b_api_ui.svg)

---

## Exp 10(a): Unit Tests for UI Components

### 🎯 Objective
Write automated unit tests and widget tests using `flutter_test`, validating business logic algorithms, JSON model deserialization schemas, regex form validators, and asserting UI widget element lifecycles via `WidgetTester`, `pumpWidget()`, and `find.byType`.

### 🛠️ Key Concepts
- **Unit Testing**: Tests isolated functions and models (`test('calculateAverage ...')`) without starting a full graphic pipeline.
- **Widget Testing (`testWidgets`)**: Runs inside a headless test environment (`FakeAsync`) providing virtual frame dispatching.
- **`WidgetTester.pump()` & `pumpAndSettle()`**: Advances the virtual clock to trigger state invalidation and await microtasks or transition completions.
- **Finders & Matchers**: `find.text('...')`, `find.byIcon(...)`, `expect(..., findsOneWidget)`.

### 💻 Dart Source Code Reference
Files: [`test/unit_test.dart`](test/unit_test.dart) • [`test/widget_test.dart`](test/widget_test.dart)

```dart
// Snippet: Widget Test with Tap and State Verification
testWidgets('InteractiveCounterWidget increments upon tap', (WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: Scaffold(body: InteractiveCounterWidget(initialValue: 10))));

  expect(find.text('10'), findsOneWidget);

  // Tap +1 increment button
  await tester.tap(find.widgetWithText(ElevatedButton, '+1'));
  await tester.pump(); // Advance virtual clock

  expect(find.text('11'), findsOneWidget);
});
```

### 🌐 Output Preview
![Exp 10a Output](assets/outputs/exp10a_unit_tests.svg)

---

## Exp 10(b): Flutter Debugging Tools

### 🎯 Objective
Utilize Flutter DevTools (Widget Inspector, Layout Explorer, Performance Profiler, and Logging View) to diagnose, debug, and eliminate frequent rendering defects: `RenderFlex` horizontal overflow errors, null-check exceptions, and memory leaks.

### 🛠️ Key Concepts
- **Flutter Widget Inspector**: Inspects runtime widget hierarchies, visualizes render object bounds, and audits flex factor distributions.
- **Layout Explorer**: Identifies unconstrained children inside `Row`/`Column` widgets and provides live boundary diagnostics.
- **`debugPrint()` & `FlutterError.onError`**: Captures unhandled exceptions and streams structured diagnostic logs without truncating payloads.
- **Defensive Error Handling**: Replaces unsafe bang operators (`user!`) with null-coalescing defaults (`user ?? 'Guest'`).

### 💻 Dart Source Code Reference
Files: [`lib/experiments/exp10_testing_debugging/debugging_demo.dart`](lib/experiments/exp10_testing_debugging/debugging_demo.dart) • [`docs/debugging_guide.md`](docs/debugging_guide.md)

```dart
// Snippet: Resolving RenderFlex Overflow and Null Check
Row(
  children: [
    const Icon(Icons.info),
    const SizedBox(width: 10),
    // Fix: Wrapping unbounded text in Expanded allows dynamic line wrapping
    Expanded(
      child: Text('Safe bounded text that wraps dynamically without RenderFlex overflow.'),
    ),
  ],
);

// Safe null fallback:
Text('User: ${_nullableUserData ?? "Guest (Safe Fallback)"}');
```

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
