// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:course_tracker/controller/courseController.dart';
import 'package:course_tracker/sql/sql.dart';
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
  var _bottomNavIndex = 0; // Default index of the first screen
  late AnimationController _animationController;
  
  final List<Widget> screens = [
    const Page1(),
    const Page2(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
    Get.put(RecipeRepository());
    getdata();
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  getdata() async {
    RecipeRepository.to.updateyourrecipe([]);

    try {
      List<Map<String, dynamic>> courses = await SQL.getCourses();
      List<Course> recipe = List.generate(courses.length, (i) {
        return Course.fromMap(courses[i]);
      });
      RecipeRepository.to.updateyourrecipe(recipe);
    } catch (e) {
      print("Error getting courses: $e");
    }

    loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomNavIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              selectedItemColor: const Color(0xFF4A00E0),
              unselectedItemColor: Colors.grey.shade400,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: _bottomNavIndex,
              onTap: (index) {
                setState(() {
                  _bottomNavIndex = index;
                  _animationController.forward(from: 0.0);
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'Courses',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Completed',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF4A00E0),
        elevation: 8,
        onPressed: () {
          // Action to add a new course
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
