import 'package:flutter_test/flutter_test.dart';
import 'package:credit_card_displayer/credit_card_displayer.dart';
import 'package:credit_card_displayer/credit_card_displayer_platform_interface.dart';
import 'package:credit_card_displayer/credit_card_displayer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCreditCardDisplayerPlatform
    with MockPlatformInterfaceMixin
    implements CreditCardDisplayerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CreditCardDisplayerPlatform initialPlatform = CreditCardDisplayerPlatform.instance;

  test('$MethodChannelCreditCardDisplayer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCreditCardDisplayer>());
  });

  test('getPlatformVersion', () async {
    CreditCardDisplayer creditCardDisplayerPlugin = CreditCardDisplayer();
    MockCreditCardDisplayerPlatform fakePlatform = MockCreditCardDisplayerPlatform();
    CreditCardDisplayerPlatform.instance = fakePlatform;

    expect(await creditCardDisplayerPlugin.getPlatformVersion(), '42');
  });
}
