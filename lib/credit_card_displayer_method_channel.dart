import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'credit_card_displayer_platform_interface.dart';

/// An implementation of [CreditCardDisplayerPlatform] that uses method channels.
class MethodChannelCreditCardDisplayer extends CreditCardDisplayerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('credit_card_displayer');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
