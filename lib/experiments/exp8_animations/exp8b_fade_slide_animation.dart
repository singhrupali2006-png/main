import 'package:flutter/material.dart';

/// Experiment 8(b): Multi-Type Animation Transitions (Fade, Slide, Scale, Rotation)
class Exp8bFadeSlideAnimationScreen extends StatefulWidget {
  const Exp8bFadeSlideAnimationScreen({super.key});

  @override
  State<Exp8bFadeSlideAnimationScreen> createState() => _Exp8bFadeSlideAnimationScreenState();
}

class _Exp8bFadeSlideAnimationScreenState extends State<Exp8bFadeSlideAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    final curve = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    // 1. Fade Animation
    _fadeAnimation = Tween<double>(begin: 0.1, end: 1.0).animate(curve);

    // 2. Slide Animation (from bottom offset to original position)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.4),
      end: Offset.zero,
    ).animate(curve);

    // 3. Scale Animation
    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(curve);

    // 4. Rotation Animation
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _replay() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 8(b): Fade, Slide, Scale & Rotate'),
        backgroundColor: Colors.violet.shade800,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Control Header
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Transition Showcases (Fade, Slide, Scale, Rotate):',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        ElevatedButton.icon(
                          onPressed: _replay,
                          icon: const Icon(Icons.replay),
                          label: const Text('Replay Transitions'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.violet.shade700, foregroundColor: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 2x2 Grid of Transitions
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.3,
                  children: [
                    // 1. FADE TRANSITION
                    _buildTransitionCard(
                      title: 'FadeTransition',
                      subtitle: 'Opacity 0.1 ➔ 1.0',
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: _buildBadge(Icons.visibility, Colors.blue, 'Fade In'),
                      ),
                    ),

                    // 2. SLIDE TRANSITION
                    _buildTransitionCard(
                      title: 'SlideTransition',
                      subtitle: 'Offset(0, 0.4) ➔ (0, 0)',
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: _buildBadge(Icons.arrow_upward, Colors.teal, 'Slide Up'),
                      ),
                    ),

                    // 3. SCALE TRANSITION
                    _buildTransitionCard(
                      title: 'ScaleTransition',
                      subtitle: 'Scale 0.6x ➔ 1.0x',
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: _buildBadge(Icons.zoom_in, Colors.amber, 'Scale Up'),
                      ),
                    ),

                    // 4. ROTATION TRANSITION
                    _buildTransitionCard(
                      title: 'RotationTransition',
                      subtitle: '0.0 ➔ 1.0 Turn',
                      child: RotationTransition(
                        turns: _rotationAnimation,
                        child: _buildBadge(Icons.rotate_right, Colors.pink, 'Spin 360°'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransitionCard({required String title, required String subtitle, required Widget child}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Center(child: child)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(IconData icon, Color color, String label) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
