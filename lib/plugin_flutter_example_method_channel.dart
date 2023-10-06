import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_flutter_example_platform_interface.dart';

/// An implementation of [PluginFlutterExamplePlatform] that uses method channels.
class MethodChannelPluginFlutterExample extends PluginFlutterExamplePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_flutter_example');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
