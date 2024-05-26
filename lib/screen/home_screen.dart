// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:button_navigation_bar/button_navigation_bar.dart';
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

class _HomeScreenState extends State<HomeScreen> {
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
        .get(
            "select * from dbo.course")
        .then((value) {
          print("valueeeeeeeeeeeeeeee${value}");  List<Map<String, dynamic>> tempResult =
          value.cast<Map<String, dynamic>>();
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

  PageController page = PageController();

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageView(
        controller: page,
        children: const [
          Page1(),
          Page2(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: ButtonNavigationBar(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        children: [
          ButtonNavigationItem(
            icon: const Icon(Icons.map_outlined),
            onPressed: () {
              page.jumpToPage(0);
            },
          ),
          ButtonNavigationItem(
            width: width * 0.3,
            icon: const Icon(Icons.data_exploration_outlined),
            onPressed: () {
              page.jumpToPage(1);
            },
          ),
          ButtonNavigationItem(
            icon: const Icon(Icons.person),
            onPressed: () {
              page.jumpToPage(2);
            },
          ),
        ],
      ),
    );
  }
}
