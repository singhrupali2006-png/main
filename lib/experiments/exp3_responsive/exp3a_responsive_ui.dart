import 'package:flutter/material.dart';

/// Experiment 3(a): Responsive UI adapting to different screen sizes using LayoutBuilder
class Exp3aResponsiveScreen extends StatelessWidget {
  const Exp3aResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 3(a): Responsive Multi-Device UI'),
        backgroundColor: Colors.purple.shade700,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Dynamic calculation of columns based on available width
          int crossAxisCount;
          double cardHeight;
          String deviceType;

          if (constraints.maxWidth >= 950) {
            crossAxisCount = 3;
            cardHeight = 170;
            deviceType = 'Desktop / Large Web Viewport (${constraints.maxWidth.toInt()}px)';
          } else if (constraints.maxWidth >= 600) {
            crossAxisCount = 2;
            cardHeight = 160;
            deviceType = 'Tablet / Medium Viewport (${constraints.maxWidth.toInt()}px)';
          } else {
            crossAxisCount = 1;
            cardHeight = 140;
            deviceType = 'Mobile Viewport (${constraints.maxWidth.toInt()}px)';
          }

          final items = [
            {'title': 'Active Users', 'value': '14,290', 'icon': Icons.people, 'color': Colors.blue},
            {'title': 'Revenue', 'value': '\$48,900', 'icon': Icons.trending_up, 'color': Colors.green},
            {'title': 'Server Health', 'value': '99.98%', 'icon': Icons.cloud_done, 'color': Colors.purple},
            {'title': 'Open Tickets', 'value': '18', 'icon': Icons.bug_report, 'color': Colors.orange},
            {'title': 'Code Deployments', 'value': '142', 'icon': Icons.rocket_launch, 'color': Colors.teal},
            {'title': 'Response Time', 'value': '124 ms', 'icon': Icons.speed, 'color': Colors.indigo},
          ];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Responsive Status Banner
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.purple.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.devices, color: Colors.purple.shade700),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Active Mode: $deviceType | Grid: $crossAxisCount columns',
                          style: TextStyle(
                            color: Colors.purple.shade900,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Responsive Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: cardHeight,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final color = item['color'] as MaterialColor;
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['title'] as String,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: color.shade50,
                                  child: Icon(item['icon'] as IconData, size: 20, color: color),
                                ),
                              ],
                            ),
                            Text(
                              item['value'] as String,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: color.shade900,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_upward, size: 14, color: Colors.green.shade600),
                                const SizedBox(width: 4),
                                Text(
                                  '+12.5% from last week',
                                  style: TextStyle(fontSize: 11, color: Colors.green.shade700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
