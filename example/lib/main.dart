import 'package:flutter/material.dart';
import 'package:credit_card_displayer/credit_card_displayer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Credit Card Displayer Example'),
        ),
        body: const Center(
          child: CreditCardDisplayer(
            cardNumber: '4111111111111111',
            expiryDate: '12/24',
            cardHolder: 'John Doe',
            width: 300,
            height: 200,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
