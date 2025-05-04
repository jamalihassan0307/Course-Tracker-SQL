// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
// import 'package:course_tracker/model.dart/RecppeModel.dart';
import 'package:course_tracker/controller/courseController.dart';
import 'package:course_tracker/widget/loaded_recipes_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<RecipeRepository>(
        initState: (state) {},
        builder: (obj) {
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
                    
                    // Header
                    const Text(
                      "My Completed Courses",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A00E0),
                      ),
                    ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
                    
                    const SizedBox(height: 5),
                    
                    // Subtitle
                    const Text(
                      "Track your learning progress",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ).animate().fadeIn(
                      delay: const Duration(milliseconds: 300),
                      duration: const Duration(milliseconds: 500),
                    ),
                    
                    SizedBox(height: height * 0.03),
                    
                    // Stats card
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Completed Courses",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${obj.yourcourse?.length ?? 0}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.white24,
                            radius: 25,
                            child: Icon(
                              Icons.check_circle_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ).animate().slideX(
                      begin: 0.3,
                      end: 0,
                      curve: Curves.easeOutQuad,
                      duration: const Duration(milliseconds: 600),
                    ),
                    
                    SizedBox(height: height * 0.03),
                    
                    // Course list
                    Expanded(
                      child: obj.yourcourse == null || obj.yourcourse!.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.purple.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.school_outlined,
                                      size: 60,
                                      color: Colors.purple.withOpacity(0.5),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    "No completed courses yet",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Complete some courses to see them here",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ).animate().fadeIn(
                                duration: const Duration(milliseconds: 800),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: LoadedRecipesWidget(
                                  delete: true,
                                  recipes: obj.yourcourse!,
                                ),
                              ),
                            ).animate().fadeIn(
                              delay: const Duration(milliseconds: 300),
                              duration: const Duration(milliseconds: 800),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
