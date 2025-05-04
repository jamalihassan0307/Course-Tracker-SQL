// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:course_tracker/controller/courseController.dart';
import 'package:course_tracker/widget/constants/staticdata.dart';
import 'package:course_tracker/widget/loaded_recipes_widget.dart';
import 'package:get/get.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<RecipeRepository>(initState: (state) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {});
      });
    }, builder: (obj) {
      return SizedBox(
        height: height,
        width: width,
        child: Center(
          child: SizedBox(
            height: height,
            width: width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05),
                
                // Handle null check for StaticData.model
                if (StaticData.model != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${StaticData.model!.username} 👋 ",
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A00E0),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          backgroundImage: StaticData.model!.image.isNotEmpty
                              ? FileImage(File(StaticData.model!.image))
                              : null,
                          child: StaticData.model!.image.isEmpty
                              ? const Icon(Icons.person, size: 40, color: Colors.purple)
                              : null,
                        ),
                      )
                    ],
                  ),
                ] else ...[
                  // Placeholder UI when model is null
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Welcome! 👋",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A00E0),
                        ),
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.purple.withOpacity(0.2),
                        child: const Icon(Icons.person, size: 40, color: Colors.purple),
                      )
                    ],
                  ),
                ],
                
                SizedBox(height: height * 0.03),
                
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "${obj.bestcourse == null ? 0 : obj.bestcourse!.length} Best Courses",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                
                SizedBox(height: height * 0.02),
                
                Expanded(
                  child: obj.bestcourse == null
                      ? const Center(
                          child: Text(
                            "No courses available yet",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : LoadedRecipesWidget(
                          recipes: obj.bestcourse!,
                        ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
