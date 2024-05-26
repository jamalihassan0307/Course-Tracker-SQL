import 'package:course_tracker/model.dart/RecppeModel.dart';
import 'package:flutter/services.dart';
// import 'package:course_tracker/model.dart/RecppeModel.dart';
import 'package:course_tracker/sql/sql.dart';
// import 'package:course_tracker/sql/sqllite.dart';
import 'package:course_tracker/screen/loginScreen.dart';
import 'package:course_tracker/widget/theme/app_theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainTheme.scaffoldBackgroundColor,
      statusBarBrightness: Brightness.light));
  runApp(const MyApp());
  await SQL.connection();
var list= await loadRecipes();
  for (var e in list) {
    
    SQL.get("INSERT INTO dbo.bcourse VALUES (${e.toMap()})");}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Dairy App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: mainTheme.scaffoldBackgroundColor),
        useMaterial3: true,
      ),

      home: const LoginScreen(),
      // HomeScreen(),
      darkTheme: mainTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
