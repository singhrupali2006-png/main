import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Experiment 5(b): State Management with setState (Local) vs Provider (Global)

// 1. Domain Model
class ProductItem {
  final String id;
  final String name;
  final double price;

  const ProductItem({required this.id, required this.name, required this.price});
}

// 2. Global State Model with ChangeNotifier
class CartNotifier extends ChangeNotifier {
  final List<ProductItem> _items = [];

  List<ProductItem> get items => List.unmodifiable(_items);
  int get itemCount => _items.length;
  double get totalPrice => _items.fold(0.0, (sum, item) => sum + item.price);

  void addItem(ProductItem item) {
    _items.add(item);
    notifyListeners(); // Dispatches reactive notifications to all listeners
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

/// Root Widget wrapping tree in ChangeNotifierProvider
class Exp5bProviderScreen extends StatelessWidget {
  const Exp5bProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartNotifier(),
      child: const _CartAppContent(),
    );
  }
}

class _CartAppContent extends StatefulWidget {
  const _CartAppContent();

  @override
  State<_CartAppContent> createState() => _CartAppContentState();
}

class _CartAppContentState extends State<_CartAppContent> {
  // Local state managed via setState
  int _localTapCount = 0;

  final List<ProductItem> catalog = const [
    ProductItem(id: 'p1', name: 'Flutter Web Blueprint', price: 29.0),
    ProductItem(id: 'p2', name: 'Dart Metaprogramming Guide', price: 19.5),
    ProductItem(id: 'p3', name: 'Provider State Architecture', price: 24.0),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 5(b): setState vs Provider Pattern'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        actions: [
          // AppBar Badge reading global Provider state
          Consumer<CartNotifier>(
            builder: (context, cartModel, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                  child: Chip(
                    avatar: const Icon(Icons.shopping_cart, size: 16, color: Colors.white),
                    label: Text(
                      '${cartModel.itemCount} items (\$$cartModel.totalPrice.toStringAsFixed(0)})',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    backgroundColor: Colors.teal.shade700,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 850),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // COMPARISON ROW: Local setState vs Global Provider
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pane 1: Local setState
                    Expanded(
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.tune, color: Colors.orange),
                                  SizedBox(width: 8),
                                  Text('Local Ephemeral State (setState)', style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text('Scope: Isolated to _CartAppContentState only.', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                              const SizedBox(height: 16),
                              Text('Local Interactions: $_localTapCount', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () => setState(() => _localTapCount++),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white),
                                child: const Text('Increment Local Tap'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Pane 2: Global Provider
                    Expanded(
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.hub, color: Colors.teal),
                                  SizedBox(width: 8),
                                  Text('Global App State (Provider)', style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text('Scope: Shared app-wide across all Consumer descendants.', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                              const SizedBox(height: 16),
                              Text('Cart Items: ${cart.itemCount} | Total: \$${cart.totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 12),
                              OutlinedButton(
                                onPressed: cart.itemCount > 0 ? () => context.read<CartNotifier>().clearCart() : null,
                                child: const Text('Clear Cart'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Catalog List
                const Text('Product Catalog (Add to Global Store):', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: catalog.length,
                  itemBuilder: (context, index) {
                    final product = catalog[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                        trailing: ElevatedButton.icon(
                          icon: const Icon(Icons.add_shopping_cart, size: 16),
                          label: const Text('Add'),
                          onPressed: () {
                            context.read<CartNotifier>().addItem(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added ${product.name} to Cart!'), duration: const Duration(seconds: 1)),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
