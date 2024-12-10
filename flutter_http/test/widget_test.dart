import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_http/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Periksa bahwa counter dimulai dari 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Temukan tombol "+" dan lakukan tap untuk menambah counter.
    final Finder incrementButton = find.byIcon(Icons.add);
    if (incrementButton.evaluate().isNotEmpty) {
      await tester.tap(incrementButton);
      await tester.pump();
      
      // Verifikasi bahwa counter meningkat.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    } else {
      fail('Button "+" not found. Ensure that there is a counter in the app with a "+" icon button.');
    }
  });
}
