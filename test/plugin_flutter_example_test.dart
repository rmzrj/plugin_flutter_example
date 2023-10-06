import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_flutter_example/plugin_flutter_example.dart';
import 'package:plugin_flutter_example/plugin_flutter_example_platform_interface.dart';
import 'package:plugin_flutter_example/plugin_flutter_example_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginFlutterExamplePlatform
    with MockPlatformInterfaceMixin
    implements PluginFlutterExamplePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PluginFlutterExamplePlatform initialPlatform = PluginFlutterExamplePlatform.instance;

  test('$MethodChannelPluginFlutterExample is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginFlutterExample>());
  });

  test('getPlatformVersion', () async {
    // PluginFlutterExample pluginFlutterExamplePlugin = PluginFlutterExample();
    MockPluginFlutterExamplePlatform fakePlatform = MockPluginFlutterExamplePlatform();
    PluginFlutterExamplePlatform.instance = fakePlatform;

    // expect(await pluginFlutterExamplePlugin.getPlatformVersion(), '42');
  });
}
