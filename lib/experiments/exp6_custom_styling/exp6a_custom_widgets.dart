import 'package:flutter/material.dart';

/// Experiment 6(a): Create Custom Widgets for Specific UI Elements
class Exp6aCustomWidgetsScreen extends StatelessWidget {
  const Exp6aCustomWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 6(a): Custom Reusable Widgets'),
        backgroundColor: Colors.deepOrange.shade800,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Demo Section 1: Custom Avatar Badge
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const CustomAvatarBadge(
                          initials: 'RS',
                          statusColor: Colors.green,
                          radius: 34,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Rupali Singh (Lead Engineer)',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Active Now • Online Status Indicator via CustomAvatarBadge',
                                style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Demo Section 2: Custom Metric Cards Grid
                const Text(
                  'Custom Metric Cards (Reusable Analytics Component):',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Expanded(
                      child: CustomMetricCard(
                        title: 'Total Traffic',
                        value: '2.4M',
                        deltaText: '+14.2%',
                        isPositive: true,
                        icon: Icons.public,
                        accentColor: Colors.indigo,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: CustomMetricCard(
                        title: 'Bounce Rate',
                        value: '24.8%',
                        deltaText: '-3.1%',
                        isPositive: true,
                        icon: Icons.call_missed_outgoing,
                        accentColor: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Demo Section 3: Custom Gradient Buttons
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Custom Gradient Buttons:',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: CustomGradientButton(
                                text: 'Generate Report',
                                icon: Icons.download_done,
                                gradientColors: const [Color(0xFFFF5722), Color(0xFFE64A19)],
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Custom Gradient Button Tapped!')),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomGradientButton(
                                text: 'Deploy Pipeline',
                                icon: Icons.rocket_launch,
                                gradientColors: const [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 1. Reusable Avatar Badge Widget
class CustomAvatarBadge extends StatelessWidget {
  final String initials;
  final Color statusColor;
  final double radius;

  const CustomAvatarBadge({
    super.key,
    required this.initials,
    this.statusColor = Colors.green,
    this.radius = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: Colors.deepOrange.shade100,
          child: Text(
            initials,
            style: TextStyle(
              fontSize: radius * 0.7,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange.shade900,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: radius * 0.45,
            height: radius * 0.45,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2.5),
            ),
          ),
        ),
      ],
    );
  }
}

/// 2. Reusable Metric Card Widget
class CustomMetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String deltaText;
  final bool isPositive;
  final IconData icon;
  final Color accentColor;

  const CustomMetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.deltaText,
    required this.isPositive,
    required this.icon,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(color: Colors.grey.shade600, fontSize: 13, fontWeight: FontWeight.w600)),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: accentColor.withOpacity(0.12),
                  child: Icon(icon, size: 18, color: accentColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  isPositive ? Icons.trending_up : Icons.trending_down,
                  size: 16,
                  color: isPositive ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 4),
                Text(
                  deltaText,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isPositive ? Colors.green.shade700 : Colors.red.shade700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 3. Reusable Gradient Button Widget
class CustomGradientButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final List<Color> gradientColors;
  final VoidCallback onPressed;

  const CustomGradientButton({
    super.key,
    required this.text,
    required this.icon,
    required this.gradientColors,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradientColors),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first.withOpacity(0.35),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 18, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
