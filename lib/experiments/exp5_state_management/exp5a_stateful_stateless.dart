import 'package:flutter/material.dart';

/// Experiment 5(a): Screen combining StatelessWidget and StatefulWidget
/// Demonstrating dynamic UI updates via setState()

class Exp5aStatefulStatelessScreen extends StatelessWidget {
  const Exp5aStatefulStatelessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 5(a): Stateless & Stateful Widgets'),
        backgroundColor: Colors.indigo.shade800,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                // 1. STATELESS WIDGET: Immutable architectural overview
                StatelessInfoBanner(
                  title: 'Stateless Widget (Immutable)',
                  description:
                      'Stateless widgets do not maintain internal mutable state. Once built, their appearance is purely driven by initial configuration properties passed to their constructor.',
                ),
                SizedBox(height: 24),

                // 2. STATEFUL WIDGET: Interactive dynamic state engine
                InteractiveCounterWidget(initialValue: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// [StatelessWidget] Implementation
class StatelessInfoBanner extends StatelessWidget {
  final String title;
  final String description;

  const StatelessInfoBanner({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: Colors.indigo.shade50,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              child: const Icon(Icons.lock_outline, color: Colors.indigo),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(fontSize: 13, color: Colors.indigo.shade700, height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// [StatefulWidget] Implementation
class InteractiveCounterWidget extends StatefulWidget {
  final int initialValue;
  const InteractiveCounterWidget({super.key, this.initialValue = 0});

  @override
  State<InteractiveCounterWidget> createState() => _InteractiveCounterWidgetState();
}

class _InteractiveCounterWidgetState extends State<InteractiveCounterWidget> {
  late int _counter;
  int _rebuildCount = 0;
  int _step = 1;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  void _modifyValue(int delta) {
    setState(() {
      _counter += (delta * _step);
      _rebuildCount++;
    });
  }

  void _resetValue() {
    setState(() {
      _counter = widget.initialValue;
      _rebuildCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Stateful Widget (Dynamic State)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Rebuilds: $_rebuildCount',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.amber.shade900),
                  ),
                ),
              ],
            ),
            const Divider(height: 28),

            // Displayed Dynamic Value
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: _counter >= 0 ? Colors.green.shade50 : Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _counter >= 0 ? Colors.green.shade300 : Colors.red.shade300,
                ),
              ),
              child: Column(
                children: [
                  const Text('CURRENT VALUE', style: TextStyle(fontSize: 12, letterSpacing: 1.2, fontWeight: FontWeight.w600, color: Colors.black54)),
                  const SizedBox(height: 6),
                  Text(
                    '$_counter',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: _counter >= 0 ? Colors.green.shade800 : Colors.red.shade800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Step Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Step Size: ', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 8),
                ChoiceChip(label: const Text('1'), selected: _step == 1, onSelected: (s) => setState(() => _step = 1)),
                const SizedBox(width: 8),
                ChoiceChip(label: const Text('5'), selected: _step == 5, onSelected: (s) => setState(() => _step = 5)),
                const SizedBox(width: 8),
                ChoiceChip(label: const Text('10'), selected: _step == 10, onSelected: (s) => setState(() => _step = 10)),
              ],
            ),
            const SizedBox(height: 20),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _modifyValue(-1),
                  icon: const Icon(Icons.remove),
                  label: Text('-$_step'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade600, foregroundColor: Colors.white),
                ),
                OutlinedButton.icon(
                  onPressed: _resetValue,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _modifyValue(1),
                  icon: const Icon(Icons.add),
                  label: Text('+$_step'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600, foregroundColor: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
