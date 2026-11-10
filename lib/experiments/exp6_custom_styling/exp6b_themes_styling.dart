import 'package:flutter/material.dart';

/// Experiment 6(b): Dynamic Theming (Light & Dark Mode) and Custom Style Systems
class Exp6bThemesStylingApp extends StatefulWidget {
  const Exp6bThemesStylingApp({super.key});

  @override
  State<Exp6bThemesStylingApp> createState() => _Exp6bThemesStylingAppState();
}

class _Exp6bThemesStylingAppState extends State<Exp6bThemesStylingApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  // Custom Light Theme Definition
  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.deepPurple,
    scaffoldBackgroundColor: const Color(0xFFF8FAFC),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  // Custom Dark Theme Definition
  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.deepPurple,
    scaffoldBackgroundColor: const Color(0xFF0F172A),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color(0xFF1E293B),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Themes & Styling Demo',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exp 6(b): Themes & Custom Styling'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Icon(_themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
                  const SizedBox(width: 8),
                  Switch(
                    value: _themeMode == ThemeMode.dark,
                    onChanged: (isDark) {
                      setState(() {
                        _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Builder(
                builder: (context) {
                  final theme = Theme.of(context);
                  final isDark = theme.brightness == Brightness.dark;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Active Theme Status Banner
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isDark ? '🌙 Dark Mode Active' : '☀️ Light Mode Active',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Material 3 dynamic color tokens automatically derive surface, onSurface, and container variations from seed color.',
                                style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Palette Tokens Showcase Card
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Active ColorScheme Tokens:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  _buildColorSwatch('Primary', theme.colorScheme.primary, theme.colorScheme.onPrimary),
                                  const SizedBox(width: 10),
                                  _buildColorSwatch('Secondary', theme.colorScheme.secondary, theme.colorScheme.onSecondary),
                                  const SizedBox(width: 10),
                                  _buildColorSwatch('Surface', theme.colorScheme.surface, theme.colorScheme.onSurface),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Interactive Styled Components
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Styled Component Previews:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.check),
                                    label: const Text('Themed Button'),
                                  ),
                                  const SizedBox(width: 12),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: const Text('Outlined Button'),
                                  ),
                                  const SizedBox(width: 12),
                                  FilledButton.tonal(
                                    onPressed: () {},
                                    child: const Text('Tonal Button'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorSwatch(String label, Color bg, Color fg) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Text(label, style: TextStyle(color: fg, fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 4),
            Text('#${bg.value.toRadixString(16).substring(2).toUpperCase()}', style: TextStyle(color: fg.withOpacity(0.8), fontSize: 10, fontFamily: 'monospace')),
          ],
        ),
      ),
    );
  }
}
