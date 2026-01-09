import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchstick/main.dart';

void main() {
  testWidgets('Matchstick app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MatchstickApp(),
      ),
    );

    // Verify that the splash screen shows up
    expect(find.text('Matchstick'), findsOneWidget);
    expect(find.text('Keep Your Fire Burning'), findsOneWidget);
    expect(find.byIcon(Icons.local_fire_department), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
