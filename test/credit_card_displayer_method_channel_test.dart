import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:credit_card_displayer/credit_card_displayer_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelCreditCardDisplayer platform = MethodChannelCreditCardDisplayer();
  const MethodChannel channel = MethodChannel('credit_card_displayer');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
