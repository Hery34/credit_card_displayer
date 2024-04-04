import 'package:flutter/material.dart';

class CreditCardDisplayer extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolder;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;

  const CreditCardDisplayer({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolder,
    this.width = 300,
    this.height = 180,
    this.backgroundColor = Colors.grey,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final String cardType = _getCardType(cardNumber);

    return Material(
      color: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              backgroundColor.withOpacity(0.7),
              backgroundColor.withOpacity(0.5),
              backgroundColor.withOpacity(0.3),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: Image.asset(
                    'assets/${_getCardTypeAsset(cardType)}',
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Text(
              cardHolder.toUpperCase(),
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardNumber,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 17,
                  ),
                ),
                Text(
                  expiryDate,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getCardType(String cardNumber) {
    if (cardNumber.startsWith('4')) {
      return 'visa';
    } else if (cardNumber.startsWith('5')) {
      return 'mastercard';
    } else if (cardNumber.startsWith('3')) {
      return 'amex';
    } else {
      return 'card';
    }
  }

  String _getCardTypeAsset(String cardType) {
    switch (cardType) {
      case 'visa':
        return 'visa.JPG';
      case 'mastercard':
        return 'mastercard.JPG';
      case 'amex':
        return 'amex.JPG';
      default:
        return 'all.JPG';
    }
  }
}
