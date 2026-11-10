import 'package:flutter/material.dart';

// Experiments Import Matrix
import 'experiments/exp1_dart_basics/dart_basics.dart' as exp1b;
import 'experiments/exp2_widgets_layouts/exp2a_widgets.dart';
import 'experiments/exp2_widgets_layouts/exp2b_layouts.dart';
import 'experiments/exp3_responsive/exp3a_responsive_ui.dart';
import 'experiments/exp3_responsive/exp3b_media_queries.dart';
import 'experiments/exp4_navigation/exp4a_navigator.dart';
import 'experiments/exp4_navigation/exp4b_named_routes.dart';
import 'experiments/exp5_state_management/exp5a_stateful_stateless.dart';
import 'experiments/exp5_state_management/exp5b_provider_state.dart';
import 'experiments/exp6_custom_styling/exp6a_custom_widgets.dart';
import 'experiments/exp6_custom_styling/exp6b_themes_styling.dart';
import 'experiments/exp7_forms/exp7a_form_inputs.dart';
import 'experiments/exp7_forms/exp7b_form_validation.dart';
import 'experiments/exp8_animations/exp8a_basic_animation.dart';
import 'experiments/exp8_animations/exp8b_fade_slide_animation.dart';
import 'experiments/exp9_api/exp9b_api_ui.dart';
import 'experiments/exp10_testing_debugging/debugging_demo.dart';

void main() {
  runApp(const MasterFlutterLabApp());
}

class MasterFlutterLabApp extends StatefulWidget {
  const MasterFlutterLabApp({super.key});

  @override
  State<MasterFlutterLabApp> createState() => _MasterFlutterLabAppState();
}

class _MasterFlutterLabAppState extends State<MasterFlutterLabApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lab (10 Exp • 20 Modules)',
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
      ),
      home: LabDashboardHome(
        isDarkMode: _themeMode == ThemeMode.dark,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}

class LabDashboardHome extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const LabDashboardHome({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<LabDashboardHome> createState() => _LabDashboardHomeState();
}

class _LabDashboardHomeState extends State<LabDashboardHome> {
  int _selectedExperimentIndex = 0;

  final List<Map<String, dynamic>> _experiments = [
    {
      'id': 'Exp 1(a)',
      'title': 'Install Flutter & Dart SDK',
      'category': 'Environment Setup',
      'icon': Icons.download_done,
      'color': Colors.blue,
      'description': 'SDK installation guide, environment variable PATH verification, flutter doctor.',
      'builder': (context) => const _Exp1aInfoCard(),
    },
    {
      'id': 'Exp 1(b)',
      'title': 'Dart Language Basics',
      'category': 'Language Syntax',
      'icon': Icons.code,
      'color': Colors.cyan,
      'description': 'Core types, control flow, OOP classes, inheritance, mixins, and async futures.',
      'builder': (context) => const _Exp1bInfoCard(),
    },
    {
      'id': 'Exp 2(a)',
      'title': 'Explore Text, Image & Container',
      'category': 'Core Widgets',
      'icon': Icons.widgets,
      'color': Colors.indigo,
      'description': 'BoxDecoration, linear gradients, rounded image clipping, and rich typography.',
      'builder': (context) => const Exp2aWidgetsScreen(),
    },
    {
      'id': 'Exp 2(b)',
      'title': 'Layouts: Row, Column & Stack',
      'category': 'Core Widgets',
      'icon': Icons.view_quilt,
      'color': Colors.teal,
      'description': 'MainAxisAlignment flex distribution and layered Positioned Z-index overlays.',
      'builder': (context) => const Exp2bLayoutsScreen(),
    },
    {
      'id': 'Exp 3(a)',
      'title': 'Responsive Multi-Device UI',
      'category': 'Responsive UI',
      'icon': Icons.devices,
      'color': Colors.purple,
      'description': 'Dynamic grid columns adapting from 1 (mobile) to 3 (desktop) via LayoutBuilder.',
      'builder': (context) => const Exp3aResponsiveScreen(),
    },
    {
      'id': 'Exp 3(b)',
      'title': 'MediaQuery & Breakpoints',
      'category': 'Responsive UI',
      'icon': Icons.aspect_ratio,
      'color': Colors.deepPurple,
      'description': 'Dynamic navigation swapping between NavigationRail and NavigationBar.',
      'builder': (context) => const Exp3bMediaQueriesScreen(),
    },
    {
      'id': 'Exp 4(a)',
      'title': 'Navigator: Push & Pop',
      'category': 'Navigation',
      'icon': Icons.route,
      'color': Colors.blueGrey,
      'description': 'Imperative route stack management, argument passing, and return value callbacks.',
      'builder': (context) => const Exp4aNavigatorScreen(),
    },
    {
      'id': 'Exp 4(b)',
      'title': 'Declarative Named Routes',
      'category': 'Navigation',
      'icon': Icons.alt_route,
      'color': Colors.purple,
      'description': 'Route tables, onGenerateRoute argument routing, and 404 error screen.',
      'builder': (context) => const Exp4bNamedRoutesApp(),
    },
    {
      'id': 'Exp 5(a)',
      'title': 'Stateless vs Stateful Widgets',
      'category': 'State Management',
      'icon': Icons.refresh,
      'color': Colors.indigo,
      'description': 'Dynamic counter state modifier with setState and rebuild tracking telemetry.',
      'builder': (context) => const Exp5aStatefulStatelessScreen(),
    },
    {
      'id': 'Exp 5(b)',
      'title': 'setState vs Provider Pattern',
      'category': 'State Management',
      'icon': Icons.hub,
      'color': Colors.blue,
      'description': 'Global ChangeNotifier shopping cart store with decoupled Consumer updates.',
      'builder': (context) => const Exp5bProviderScreen(),
    },
    {
      'id': 'Exp 6(a)',
      'title': 'Custom Modular Widgets',
      'category': 'Customization',
      'icon': Icons.extension,
      'color': Colors.deepOrange,
      'description': 'Reusable avatar badges with presence dots, metric cards, and gradient buttons.',
      'builder': (context) => const Exp6aCustomWidgetsScreen(),
    },
    {
      'id': 'Exp 6(b)',
      'title': 'Themes & Custom Styling',
      'category': 'Customization',
      'icon': Icons.palette,
      'color': Colors.pink,
      'description': 'Material 3 colorSchemeSeed, tonal palettes, and live Dark/Light mode switcher.',
      'builder': (context) => const Exp6bThemesStylingApp(),
    },
    {
      'id': 'Exp 7(a)',
      'title': 'Interactive Form Inputs',
      'category': 'Forms & Validation',
      'icon': Icons.assignment,
      'color': Colors.teal,
      'description': 'Text inputs, dropdown selectors, sliders, switches, radio, and checkboxes.',
      'builder': (context) => const Exp7aFormInputsScreen(),
    },
    {
      'id': 'Exp 7(b)',
      'title': 'Form Validation & Errors',
      'category': 'Forms & Validation',
      'icon': Icons.verified,
      'color': Colors.rose,
      'description': 'GlobalKey<FormState>, email regex validation, password strength, and inline errors.',
      'builder': (context) => const Exp7bFormValidationScreen(),
    },
    {
      'id': 'Exp 8(a)',
      'title': 'Explicit UI Animations',
      'category': 'Animations',
      'icon': Icons.auto_awesome,
      'color': Colors.purple,
      'description': 'AnimationController, Curves.easeInOutCubic, and AnimatedBuilder scaling.',
      'builder': (context) => const Exp8aBasicAnimationScreen(),
    },
    {
      'id': 'Exp 8(b)',
      'title': 'Fade, Slide, Scale & Rotate',
      'category': 'Animations',
      'icon': Icons.animation,
      'color': Colors.violet,
      'description': '2x2 choreographed matrix of FadeTransition, SlideTransition, and ScaleTransition.',
      'builder': (context) => const Exp8bFadeSlideAnimationScreen(),
    },
    {
      'id': 'Exp 9(a)',
      'title': 'Fetch Data from REST API',
      'category': 'API & Networking',
      'icon': Icons.cloud_download,
      'color': Colors.lightBlue,
      'description': 'HTTP service querying JSONPlaceholder, Post model deserialization, and offline mock.',
      'builder': (context) => const _Exp9aInfoCard(),
    },
    {
      'id': 'Exp 9(b)',
      'title': 'REST Presentation in UI',
      'category': 'API & Networking',
      'icon': Icons.list_alt,
      'color': Colors.blue,
      'description': 'FutureBuilder reactive lists, pull-to-refresh, search filter, and loading spinner.',
      'builder': (context) => const Exp9bApiUiScreen(),
    },
    {
      'id': 'Exp 10(a)',
      'title': 'Automated Unit & Widget Tests',
      'category': 'Testing & Debugging',
      'icon': Icons.fact_check,
      'color': Colors.green,
      'description': 'Automated test suite with fake async pump, tap interactions, and assertion checks.',
      'builder': (context) => const _Exp10aInfoCard(),
    },
    {
      'id': 'Exp 10(b)',
      'title': 'DevTools & Issue Resolution',
      'category': 'Testing & Debugging',
      'icon': Icons.bug_report,
      'color': Colors.blueGrey,
      'description': 'Flutter DevTools guide, overflow bug fixing, and null-safety exception handlers.',
      'builder': (context) => const Exp10bDebuggingScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final activeExp = _experiments[_selectedExperimentIndex];
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      appBar: AppBar(
        title: Text('${activeExp['id']}: ${activeExp['title']}'),
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onToggleTheme,
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      drawer: isDesktop ? null : _buildDrawer(),
      body: Row(
        children: [
          if (isDesktop)
            SizedBox(
              width: 320,
              child: _buildDrawerContent(),
            ),
          if (isDesktop) const VerticalDivider(width: 1, thickness: 1),
          Expanded(
            child: Builder(
              builder: (context) => (activeExp['builder'] as WidgetBuilder)(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(child: _buildDrawerContent());
  }

  Widget _buildDrawerContent() {
    return Column(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF02569B), Color(0xFF0175C2)],
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.flutter_dash, size: 38, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  'Flutter & Dart Laboratory',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '10 Experiments • 20 Discrete Modules',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _experiments.length,
            itemBuilder: (context, index) {
              final exp = _experiments[index];
              final isSelected = index == _selectedExperimentIndex;
              final color = exp['color'] as MaterialColor;

              return ListTile(
                selected: isSelected,
                selectedTileColor: color.withOpacity(0.12),
                leading: CircleAvatar(
                  radius: 14,
                  backgroundColor: isSelected ? color : Colors.grey.shade200,
                  child: Icon(exp['icon'] as IconData, size: 16, color: isSelected ? Colors.white : Colors.grey.shade700),
                ),
                title: Text(
                  exp['id'] as String,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                    color: isSelected ? color.shade900 : null,
                    fontSize: 13,
                  ),
                ),
                subtitle: Text(
                  exp['title'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11),
                ),
                onTap: () {
                  setState(() => _selectedExperimentIndex = index);
                  if (Navigator.canPop(context)) Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// Information Cards for CLI/SDK-centric experiments
class _Exp1aInfoCard extends StatelessWidget {
  const _Exp1aInfoCard();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 650),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Exp 1(a): Flutter & Dart SDK Installation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Divider(height: 20),
                  Text('• SDK: Flutter 3.24.0 / Dart 3.5.0\n• Platforms: Chrome Web, Windows x64, Android SDK 34\n• Verification: flutter doctor -v\n• Automated installer: scripts/install_flutter.ps1'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Exp1bInfoCard extends StatelessWidget {
  const _Exp1bInfoCard();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 650),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Exp 1(b): Dart Language Basics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Divider(height: 20),
                  const Text('Demonstrates core Dart language constructs: strong typing, OOP classes, inheritance, mixins, and async Future computation.'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => exp1b.main(),
                    child: const Text('Execute Dart Basics Console Output'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Exp9aInfoCard extends StatelessWidget {
  const _Exp9aInfoCard();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 650),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Exp 9(a): REST API Client & Deserializer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Divider(height: 20),
                  Text('• Endpoint: https://jsonplaceholder.typicode.com/posts\n• Model: Post.fromJson factory\n• Exception handling: Custom ApiException with status code\n• Resilient fallback mock: Included in ApiService'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Exp10aInfoCard extends StatelessWidget {
  const _Exp10aInfoCard();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 650),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Exp 10(a): Automated Unit & Widget Test Suite', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Divider(height: 20),
                  Text('• 9 Automated Test Cases configured in test/unit_test.dart and test/widget_test.dart\n• Tests business logic, model serialization, regex validators, and widget lifecycle taps with pump().'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
