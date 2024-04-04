import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:credit_card_displayer/credit_card_displayer.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Credit Card Displayer Integration Test',
      (WidgetTester tester) async {
    // Créez une instance de CreditCardDisplayer
    const CreditCardDisplayer creditCardDisplayer = CreditCardDisplayer(
      cardNumber: '4111111111111111',
      expiryDate: '12/24',
      cardHolder: 'John Doe',
    );

    // Ajoutez le widget CreditCardDisplayer à l'arbre des widgets
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: creditCardDisplayer,
        ),
      ),
    );

    // Vérifiez que le widget CreditCardDisplayer est affiché correctement
    expect(find.byType(CreditCardDisplayer), findsOneWidget);
    expect(find.text('4111111111111111'), findsOneWidget);
    expect(find.text('12/24'), findsOneWidget);
    expect(find.text('JOHN DOE'), findsOneWidget);
  });
}
