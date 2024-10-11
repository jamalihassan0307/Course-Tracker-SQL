import 'package:course_tracker/screen/SignupScreen.dart';
import 'package:flutter/material.dart';

void main() async {
  // await LocatorInjector.setupLocator();
  runApp(const MainApplication());
}

class MainApplication extends StatelessWidget {
  const MainApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // navigatorKey: locator<NavigatorService>().navigatorKey,
      home: SignUp(),
    );
  }
}
