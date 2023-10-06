import 'package:flutter/material.dart';

class PluginFlutterExample extends StatelessWidget {
  PluginFlutterExample({super.key, required this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;
  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return WillPopScope(
      onWillPop: () async {
        _onBackPressed();
        return false;
      },
      child: MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
            body: Container(
          child: Text("Plugin Demo app"),
        )),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    if (navigatorKey.currentContext != null &&
        Navigator.canPop(navigatorKey.currentContext!)) {
      Navigator.pop(navigatorKey.currentContext!);
    } else {
      if (Navigator.canPop(ctx)) {
        Navigator.pop(ctx);
      }
    }

    return false;
  }
}

// class PluginFlutterExample {
//   Future<String?> getPlatformVersion() {
//     return PluginFlutterExamplePlatform.instance.getPlatformVersion();
//   }
// }
