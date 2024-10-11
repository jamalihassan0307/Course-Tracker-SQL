// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:course_tracker/controller/courseController.dart';
import 'package:course_tracker/sql/sql.dart';
// import 'package:course_tracker/sql/sqllite.dart';
import 'package:course_tracker/model.dart/RecppeModel.dart';
import 'package:course_tracker/screen/nev_bar/page1.dart';
import 'package:course_tracker/screen/nev_bar/page2.dart';
import 'package:course_tracker/screen/settingScreen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of the first screen

  final list = [
    Page1(),
    Page2(),
    SettingsScreen(),
  ];

  final iconList = <IconData>[
    Icons.home,
    Icons.brightness_6,
    Icons.settings
  ];

  @override
  void initState() {
    Get.put(RecipeRepository());
    getdata();
    super.initState();
  }

  getdata() {
    RecipeRepository.to.updateyourrecipe([]);

    try {
      SQL
        .get("select * from dbo.course")
        .then((value) {
          print("valueeeeeeeeeeeeeeee${value}");  
          List<Map<String, dynamic>> tempResult = value.cast<Map<String, dynamic>>();
          List<Course> recipe = List.generate(tempResult.length, (i) {
            return Course.fromMap(tempResult[i]);
          });
          RecipeRepository.to.updateyourrecipe(recipe);
        });
      
    } catch (e) {
      print("errorrr     $e");
      return null;
    }

    loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        currentIndex: _bottomNavIndex,backgroundColor: Colors.white,   
            onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'New Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_rounded),
            label: 'Your courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
