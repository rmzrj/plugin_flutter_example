import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:plugin_flutter_example/plugin_flutter_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "plugin_example_page");
  String _platformVersion = 'Unknown';
  // final _pluginFlutterExamplePlugin = PluginFlutterExample();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    // try {
    //   platformVersion =
    //       await _pluginFlutterExamplePlugin.getPlatformVersion() ?? 'Unknown platform version';
    // } on PlatformException {
    //   platformVersion = 'Failed to get platform version.';
    // }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //   _platformVersion = platformVersion;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          _onBackPress();
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin Demo app'),
          ),
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  PluginFlutterExample(navigatorKey: navigatorKey,)),
                  );
                },
                child: const Text("Hudini Ecommerce")),
          ),
        ),
      ),
    );
    ;
  }

  void _onBackPress() {
    if (Navigator.canPop(navigatorKey.currentContext!)) {
      Navigator.pop(navigatorKey.currentContext!);
    }
  }
}
