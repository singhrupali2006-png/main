import 'package:flutter/material.dart';

/// Experiment 4(b): Declarative Navigation with Named Routes and onGenerateRoute
class Exp4bNamedRoutesApp extends StatelessWidget {
  const Exp4bNamedRoutesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      // Dynamic argument routing via onGenerateRoute
      onGenerateRoute: (settings) {
        if (settings.name == '/profile') {
          final args = settings.arguments as UserProfileArgs?;
          return MaterialPageRoute(
            builder: (context) => ProfileScreen(
              args: args ?? UserProfileArgs(username: 'Guest', role: 'Viewer'),
            ),
          );
        }
        // Unknown route fallback (404)
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
      },
    );
  }
}

class UserProfileArgs {
  final String username;
  final String role;
  UserProfileArgs({required this.username, required this.role});
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 4(b): Named Routes (Home)'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.alt_route, size: 50, color: Colors.deepPurple),
                    const SizedBox(height: 12),
                    const Text('Named Route Registry Demo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Routes configured: "/" , "/profile" , "/settings"', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 24),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: const Text('Navigate to "/profile" with Arguments'),
                      subtitle: const Text('Passes UserProfileArgs(username, role)'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/profile',
                          arguments: UserProfileArgs(username: 'Rupali Singh', role: 'FullStack Engineer'),
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.settings)),
                      title: const Text('Navigate to "/settings"'),
                      subtitle: const Text('Static route mapped directly in routes table'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => Navigator.pushNamed(context, '/settings'),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.error_outline)),
                      title: const Text('Test Unknown Route (404)'),
                      subtitle: const Text('Navigate to "/unregistered-path"'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => Navigator.pushNamed(context, '/unregistered-path'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final UserProfileArgs args;
  const ProfileScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen (/profile)')),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(radius: 36, child: Text(args.username.substring(0, 1), style: const TextStyle(fontSize: 24))),
                const SizedBox(height: 12),
                Text(args.username, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(args.role, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Back to Home')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Screen (/settings)')),
      body: Center(
        child: ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Back to Home')),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404 Not Found')),
      body: const Center(child: Text('Requested route does not exist.')),
    );
  }
}
