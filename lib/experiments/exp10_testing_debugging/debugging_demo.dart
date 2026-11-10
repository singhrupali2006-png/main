import 'package:flutter/material.dart';

/// Experiment 10(b): Flutter Debugging Tools & Issue Resolution Demo
class Exp10bDebuggingScreen extends StatefulWidget {
  const Exp10bDebuggingScreen({super.key});

  @override
  State<Exp10bDebuggingScreen> createState() => _Exp10bDebuggingScreenState();
}

class _Exp10bDebuggingScreenState extends State<Exp10bDebuggingScreen> {
  bool _applyOverflowFix = true;
  bool _applyNullSafeFix = true;
  String? _nullableUserData;
  final List<String> _diagnosticLogs = [];

  void _log(String message) {
    final timestamp = DateTime.now().toIso8601String().substring(11, 19);
    setState(() {
      _diagnosticLogs.insert(0, '[$timestamp] $message');
    });
    debugPrint('[FLUTTER DIAGNOSTIC] $message');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 10(b): Debugging Tools & Issue Resolution'),
        backgroundColor: Colors.slate.shade800,
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
                // 1. TOOL HIGHLIGHT BANNER
                Card(
                  elevation: 2,
                  color: Colors.blueGrey.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '🛠️ Flutter DevTools Suite Integration',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '1. Widget Inspector: Live DOM tree, layout boundary diagnostics.\n'
                          '2. CPU Profiler: 60/120 FPS jank identification, flame graphs.\n'
                          '3. Memory Profiler: Heap allocation snapshots, leak tracking.\n'
                          '4. Network Tab: Request payload, headers, and SSL timing.',
                          style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 2. ISSUE 1: RenderFlex Overflow Demonstration & Fix
                _buildDiagnosticCard(
                  title: 'Issue 1: RenderFlex Overflow Error',
                  description: 'Unconstrained row child triggers yellow/black stripe overflow without Expanded.',
                  switchLabel: 'Apply Overflow Fix (Wrap with Expanded)',
                  switchValue: _applyOverflowFix,
                  onChanged: (val) {
                    setState(() => _applyOverflowFix = val);
                    _log(_applyOverflowFix ? 'Fixed: Wrapped in Expanded widget' : 'Warning: RenderFlex overflow triggered');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info, color: Colors.blue),
                        const SizedBox(width: 10),
                        if (_applyOverflowFix)
                          const Expanded(
                            child: Text(
                              'Safe bounded text that wraps dynamically without causing RenderFlex overflow warnings.',
                              style: TextStyle(fontSize: 13),
                            ),
                          )
                        else
                          const SizedBox(
                            width: 600,
                            child: Text(
                              'Overly wide text without wrap constraint causing horizontal overflow warning in narrow viewports.',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 3. ISSUE 2: Null Safety Assertion Violation
                _buildDiagnosticCard(
                  title: 'Issue 2: Unhandled Null Pointer Exception',
                  description: 'Accessing property on null object without fallback assertion.',
                  switchLabel: 'Apply Null-Safe Fallback (? :)',
                  switchValue: _applyNullSafeFix,
                  onChanged: (val) {
                    setState(() => _applyNullSafeFix = val);
                    _log(_applyNullSafeFix ? 'Handled: Defaulted to fallback guest user' : 'Simulating null object access');
                  },
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _nullableUserData = _nullableUserData == null ? 'Verified Developer' : null;
                          });
                          _log('User State Toggled: ${_nullableUserData ?? "null"}');
                        },
                        child: const Text('Toggle State (Null vs Data)'),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        _applyNullSafeFix
                            ? 'User: ${_nullableUserData ?? "Guest (Safe Fallback)"}'
                            : 'User: ${_nullableUserData!}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 4. LIVE DIAGNOSTIC CONSOLE
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Live Diagnostics Log Output (debugPrint):', style: TextStyle(fontWeight: FontWeight.bold)),
                        const Divider(),
                        if (_diagnosticLogs.isEmpty)
                          const Text('No diagnostic events recorded yet. Interact with toggles above.', style: TextStyle(color: Colors.grey, fontSize: 12))
                        else
                          ..._diagnosticLogs.take(5).map((log) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                child: Text(log, style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Colors.blueGrey)),
                              )),
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

  Widget _buildDiagnosticCard({
    required String title,
    required String description,
    required String switchLabel,
    required bool switchValue,
    required ValueChanged<bool> onChanged,
    required Widget child,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(description, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
            const SizedBox(height: 12),
            child,
            const SizedBox(height: 12),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(switchLabel, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              value: switchValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
