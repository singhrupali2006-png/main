import 'package:flutter/material.dart';

/// Experiment 2(a): Explore Flutter Widgets (Text, Image, Container)
class Exp2aWidgetsScreen extends StatelessWidget {
  const Exp2aWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 2(a): Core Flutter Widgets'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SECTION 1: Container Widget Exploration
                Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.only(bottom: 24.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                    border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
                  ),
                  child: Row(
                    children: [
                      // SECTION 2: Image Widget with ClipRRect & Network placeholder
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.white.withOpacity(0.15),
                          child: Image.network(
                            'https://picsum.photos/seed/flutter2a/200',
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(color: Colors.white),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.image_outlined,
                                size: 40,
                                color: Colors.white,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // SECTION 3: RichText & Text Widgets
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Container & RichText Showcase',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 6),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(color: Colors.white70, fontSize: 13),
                                children: [
                                  TextSpan(text: 'Styling with '),
                                  TextSpan(
                                    text: 'BoxDecoration',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amberAccent,
                                    ),
                                  ),
                                  TextSpan(text: ', linear gradients, drop-shadows, and clipped images.'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Card displaying discrete Widget Demonstrations
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Typography & Text Variations',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Divider(height: 24),
                        const Text(
                          'Headline Medium with Underline Style',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.indigoAccent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Body text demonstrating overflow trimming with ellipsis when content exceeds maximum allowed viewport boundaries in responsive applications.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey.shade700, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // CircleAvatar and Image Variations
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundColor: Colors.indigo.shade100,
                              child: const Icon(Icons.person, size: 40, color: Colors.indigo),
                            ),
                            const SizedBox(height: 8),
                            const Text('CircleAvatar', style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Column(
                          children: [
                            ClipOval(
                              child: Container(
                                width: 72,
                                height: 72,
                                color: Colors.teal.shade50,
                                child: const Icon(Icons.flutter_dash, size: 42, color: Colors.teal),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text('ClipOval Image', style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.orange, width: 2),
                              ),
                              child: const Icon(Icons.brush, size: 36, color: Colors.orange),
                            ),
                            const SizedBox(height: 8),
                            const Text('Custom Border', style: TextStyle(fontWeight: FontWeight.w500)),
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
