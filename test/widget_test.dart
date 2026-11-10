import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lab_experiments/experiments/exp5_state_management/exp5a_stateful_stateless.dart';
import 'package:flutter_lab_experiments/experiments/exp6_custom_styling/exp6a_custom_widgets.dart';

void main() {
  group('Exp 10(a) - Widget UI Component Tests', () {
    testWidgets('StatelessInfoBanner renders title and description', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StatelessInfoBanner(
              title: 'Unit Test Banner Title',
              description: 'Sample description for widget test verification.',
            ),
          ),
        ),
      );

      // Verify textual presence
      expect(find.text('Unit Test Banner Title'), findsOneWidget);
      expect(find.text('Sample description for widget test verification.'), findsOneWidget);
      expect(find.byIcon(Icons.lock_outline), findsOneWidget);
    });

    testWidgets('InteractiveCounterWidget displays initial value and increments upon button tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: InteractiveCounterWidget(initialValue: 10),
          ),
        ),
      );

      // 1. Initial State check
      expect(find.text('10'), findsOneWidget);
      expect(find.text('Rebuilds: 0'), findsOneWidget);

      // 2. Tap increment button ('+1')
      final incrementFinder = find.widgetWithText(ElevatedButton, '+1');
      expect(incrementFinder, findsOneWidget);
      await tester.tap(incrementFinder);
      await tester.pump(); // Trigger frame rebuild

      // 3. Assert updated counter state
      expect(find.text('11'), findsOneWidget);
      expect(find.text('Rebuilds: 1'), findsOneWidget);

      // 4. Tap decrement button ('-1')
      final decrementFinder = find.widgetWithText(ElevatedButton, '-1');
      await tester.tap(decrementFinder);
      await tester.pump();

      expect(find.text('10'), findsOneWidget);
      expect(find.text('Rebuilds: 2'), findsOneWidget);

      // 5. Test Reset Button
      final resetFinder = find.widgetWithText(OutlinedButton, 'Reset');
      await tester.tap(resetFinder);
      await tester.pump();

      expect(find.text('10'), findsOneWidget);
      expect(find.text('Rebuilds: 3'), findsOneWidget);
    });

    testWidgets('CustomMetricCard renders delta badge and icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomMetricCard(
              title: 'Total Revenue',
              value: '\$98,000',
              deltaText: '+15.4%',
              isPositive: true,
              icon: Icons.trending_up,
              accentColor: Colors.green,
            ),
          ),
        ),
      );

      expect(find.text('Total Revenue'), findsOneWidget);
      expect(find.text('\$98,000'), findsOneWidget);
      expect(find.text('+15.4%'), findsOneWidget);
      expect(find.byIcon(Icons.trending_up), findsWidgets);
    });
  });
}
