import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:credit_card_displayer/credit_card_displayer.dart';

void main() {
  group('CreditCardDisplayer', () {
    testWidgets('displays correct card number', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CreditCardDisplayer(
            cardNumber: '4111111111111111',
            expiryDate: '12/24',
            cardHolder: 'John Doe',
          ),
        ),
      );

      expect(find.text('4111111111111111'), findsOneWidget);
    });

    testWidgets('displays correct expiry date', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CreditCardDisplayer(
            cardNumber: '4111111111111111',
            expiryDate: '12/24',
            cardHolder: 'John Doe',
          ),
        ),
      );

      expect(find.text('12/24'), findsOneWidget);
    });

    testWidgets('displays correct card holder name',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CreditCardDisplayer(
            cardNumber: '4111111111111111',
            expiryDate: '12/24',
            cardHolder: 'John Doe',
          ),
        ),
      );

      expect(find.text('JOHN DOE'), findsOneWidget);
    });

    testWidgets('displays visa logo for visa card',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CreditCardDisplayer(
            cardNumber: '4111111111111111',
            expiryDate: '12/24',
            cardHolder: 'John Doe',
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      final Image image = tester.widget(find.byType(Image));
      expect(image.image, isInstanceOf<AssetImage>());
      expect((image.image as AssetImage).assetName, equals('assets/visa.JPG'));
    });
  });
}
