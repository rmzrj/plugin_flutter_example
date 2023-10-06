import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_flutter_example_method_channel.dart';

abstract class PluginFlutterExamplePlatform extends PlatformInterface {
  /// Constructs a PluginFlutterExamplePlatform.
  PluginFlutterExamplePlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginFlutterExamplePlatform _instance = MethodChannelPluginFlutterExample();

  /// The default instance of [PluginFlutterExamplePlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginFlutterExample].
  static PluginFlutterExamplePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginFlutterExamplePlatform] when
  /// they register themselves.
  static set instance(PluginFlutterExamplePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
