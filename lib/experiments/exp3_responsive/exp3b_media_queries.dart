import 'package:flutter/material.dart';

/// Experiment 3(b): Media Queries and Breakpoints for Adaptive Responsiveness
class Exp3bMediaQueriesScreen extends StatefulWidget {
  const Exp3bMediaQueriesScreen({super.key});

  @override
  State<Exp3bMediaQueriesScreen> createState() => _Exp3bMediaQueriesScreenState();
}

class _Exp3bMediaQueriesScreenState extends State<Exp3bMediaQueriesScreen> {
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final height = media.size.height;
    final isDesktop = width >= 1024;
    final isTablet = width >= 600 && width < 1024;
    final isMobile = width < 600;

    String breakpointName = isDesktop
        ? 'Desktop (>= 1024px)'
        : (isTablet ? 'Tablet (600px - 1023px)' : 'Mobile (< 600px)');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 3(b): MediaQuery & Breakpoints'),
        backgroundColor: Colors.cyan.shade800,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: isMobile
          ? NavigationBar(
              selectedIndex: _selectedNavIndex,
              onDestinationSelected: (idx) => setState(() => _selectedNavIndex = idx),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
                NavigationDestination(icon: Icon(Icons.analytics), label: 'Analytics'),
                NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
              ],
            )
          : null,
      body: Row(
        children: [
          // Adaptive NavigationRail for Tablet and Desktop
          if (!isMobile)
            NavigationRail(
              selectedIndex: _selectedNavIndex,
              onDestinationSelected: (idx) => setState(() => _selectedNavIndex = idx),
              labelType: isDesktop
                  ? NavigationRailLabelType.all
                  : NavigationRailLabelType.selected,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.cyan.shade700,
                  child: const Icon(Icons.flutter_dash, color: Colors.white),
                ),
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.analytics_outlined),
                  selectedIcon: Icon(Icons.analytics),
                  label: Text('Analytics'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),

          if (!isMobile) const VerticalDivider(thickness: 1, width: 1),

          // Main Responsive Content View
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Active Breakpoint Badge
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.cyan.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.cyan.shade300),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.monitor, color: Colors.cyan.shade800, size: 28),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Active Breakpoint: $breakpointName',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.cyan.shade900,
                                    ),
                                  ),
                                  Text(
                                    'Responsive layout automatically chooses NavigationRail or BottomNavigationBar',
                                    style: TextStyle(fontSize: 12, color: Colors.cyan.shade700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // MediaQuery Inspector Table
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Live MediaQuery Telemetry Data',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Divider(height: 24),
                              _buildMetricRow('Window Width', '${width.toStringAsFixed(1)} dp'),
                              _buildMetricRow('Window Height', '${height.toStringAsFixed(1)} dp'),
                              _buildMetricRow('Device Orientation', media.orientation.name.toUpperCase()),
                              _buildMetricRow('Device Pixel Ratio', '${media.devicePixelRatio}x'),
                              _buildMetricRow('Safe Area Top Padding', '${media.padding.top} dp'),
                              _buildMetricRow('Platform Brightness', media.platformBrightness.name.toUpperCase()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w500)),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
