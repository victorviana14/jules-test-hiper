import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nfe_scanner_app/main.dart';

void main() {
  testWidgets('Login screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the Login screen is shown by checking for its title and fields.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('E-mail'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Verify that the old counter app widgets are not present.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);
    expect(find.byIcon(Icons.add), findsNothing);
  });
}
