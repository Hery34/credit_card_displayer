import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'credit_card_displayer_method_channel.dart';

abstract class CreditCardDisplayerPlatform extends PlatformInterface {
  /// Constructs a CreditCardDisplayerPlatform.
  CreditCardDisplayerPlatform() : super(token: _token);

  static final Object _token = Object();

  static CreditCardDisplayerPlatform _instance = MethodChannelCreditCardDisplayer();

  /// The default instance of [CreditCardDisplayerPlatform] to use.
  ///
  /// Defaults to [MethodChannelCreditCardDisplayer].
  static CreditCardDisplayerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CreditCardDisplayerPlatform] when
  /// they register themselves.
  static set instance(CreditCardDisplayerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
