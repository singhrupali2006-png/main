import 'package:flutter/material.dart';

/// Experiment 4(a): Imperative Screen Navigation with Navigator (Push, Pop, Data Transfer)
class Exp4aNavigatorScreen extends StatefulWidget {
  const Exp4aNavigatorScreen({super.key});

  @override
  State<Exp4aNavigatorScreen> createState() => _Exp4aNavigatorScreenState();
}

class _Exp4aNavigatorScreenState extends State<Exp4aNavigatorScreen> {
  String _returnedStatus = 'No items processed yet.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 4(a): Navigator (Push & Pop)'),
        backgroundColor: Colors.blueGrey.shade800,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Icon(Icons.route, size: 48, color: Colors.blueGrey.shade700),
                        const SizedBox(height: 12),
                        const Text(
                          'Primary Screen (Navigator 1.0)',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Press below to push the Item Details screen onto the navigation stack with custom arguments.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Navigate to Detail Screen'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade800,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                          onPressed: () async {
                            // Imperative push with return value await
                            final result = await Navigator.push<String>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailScreen(
                                  itemId: 'ITEM-9042',
                                  itemName: 'Flutter Web Cloud Engine',
                                  price: 49.99,
                                ),
                              ),
                            );

                            if (result != null && mounted) {
                              setState(() => _returnedStatus = result);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Received from Detail Screen: $result'),
                                  backgroundColor: Colors.teal,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Return status card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blueGrey.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blueGrey.shade700),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Return Stack Result: $_returnedStatus',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                      ),
                    ],
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

/// Destination Screen receiving parameters and returning result
class DetailScreen extends StatelessWidget {
  final String itemId;
  final String itemName;
  final double price;

  const DetailScreen({
    super.key,
    required this.itemId,
    required this.itemName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Received Item Data:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Divider(height: 20),
                    Text('Item ID: $itemId', style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 6),
                    Text('Item Name: $itemName', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    Text('Price: \$${price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 14, color: Colors.teal)),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Transaction Cancelled'),
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context, 'Confirmed Purchase of $itemId'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
                          child: const Text('Confirm & Pop'),
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
