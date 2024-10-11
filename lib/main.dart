import 'package:course_tracker/screen/SignupScreen.dart';
import 'package:flutter/material.dart';

void main() async {
  // await LocatorInjector.setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // navigatorKey: locator<NavigatorService>().navigatorKey,
      home: SignUp(),
    );
  }
}
