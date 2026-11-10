import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Experiment 8(a): Animations using Flutter's Explicit Animation Framework
class Exp8aBasicAnimationScreen extends StatefulWidget {
  const Exp8aBasicAnimationScreen({super.key});

  @override
  State<Exp8aBasicAnimationScreen> createState() => _Exp8aBasicAnimationScreenState();
}

class _Exp8aBasicAnimationScreenState extends State<Exp8aBasicAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    final curved = CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic);

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.15).animate(curved);
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(curved);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 8(a): AnimationController & AnimatedBuilder'),
        backgroundColor: Colors.purple.shade900,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      'Explicit Multi-Property Animation',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'AnimatedBuilder coordinates scaling, rotation, and gradient shifts.',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    ),
                    const SizedBox(height: 36),

                    // ANIMATED OBJECT
                    SizedBox(
                      height: 180,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _rotationAnimation.value * 0.25,
                            child: Transform.scale(
                              scale: _scaleAnimation.value,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.purple.shade600,
                                      Colors.indigo.shade600,
                                      Colors.cyan.shade400,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(28),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.purple.withOpacity(0.4),
                                      blurRadius: 20 * _scaleAnimation.value,
                                      spreadRadius: 4,
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Icon(Icons.auto_awesome, size: 54, color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Controller Progress Indicator
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Column(
                          children: [
                            LinearProgressIndicator(
                              value: _controller.value,
                              backgroundColor: Colors.purple.shade50,
                              color: Colors.purple.shade600,
                              minHeight: 6,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Timeline Progress: ${(_controller.value * 100).toInt()}% • Status: ${_controller.status.name.toUpperCase()}',
                              style: const TextStyle(fontFamily: 'monospace', fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // Playback Controls
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _controller.forward(),
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('Forward'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _controller.reverse(),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Reverse'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _controller.repeat(reverse: true),
                          icon: const Icon(Icons.repeat),
                          label: const Text('Loop'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () => _controller.stop(),
                          icon: const Icon(Icons.stop),
                          label: const Text('Stop'),
                        ),
                      ],
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
