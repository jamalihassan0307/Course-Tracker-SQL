// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_typing_uninitialized_variables
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:course_tracker/controller/courseController.dart';
import 'package:course_tracker/model.dart/RecppeModel.dart';
import 'package:course_tracker/widget/constants/strings.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final Course recipe;
  bool? delete;
  RecipeDetailsScreen({
    super.key,
    required this.recipe,
    this.delete,
  });

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/aaa.jfif"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top navigation bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ).animate().fadeIn(duration: const Duration(milliseconds: 600)),
                      
                      // Course title
                      Expanded(
                        child: Center(
                          child: Text(
                            Strings.courseDetails,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ).animate().fadeIn(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 600),
                      ),
                      
                      // Favorite button
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                          size: 20,
                        ),
                      ).animate().fadeIn(duration: const Duration(milliseconds: 600)),
                    ],
                  ),
                ),
                
                SizedBox(height: height * 0.02),
                
                // Course image
                Center(
                  child: Hero(
                    tag: widget.recipe.imageUrl,
                    child: Container(
                      height: height * 0.25,
                      width: height * 0.25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                        image: DecorationImage(
                          image: FileImage(File(widget.recipe.imageUrl)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ).animate().scale(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutBack,
                ),
                
                SizedBox(height: height * 0.04),
                
                // Course title
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      widget.recipe.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ).animate().fadeIn(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 600),
                ),
                
                SizedBox(height: height * 0.03),
                
                // Course details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InfoViewer(
                          name: Strings.fee,
                          amount: widget.recipe.paid_fee,
                          icon: Icons.attach_money,
                        ),
                        InfoViewer(
                          name: Strings.startDate,
                          amount: widget.recipe.startDate,
                          icon: Icons.calendar_today,
                        ),
                        InfoViewer(
                          name: Strings.endDate,
                          amount: widget.recipe.endDate,
                          icon: Icons.event_available,
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn(
                  delay: const Duration(milliseconds: 600),
                  duration: const Duration(milliseconds: 600),
                ).moveY(
                  begin: 30,
                  end: 0,
                  delay: const Duration(milliseconds: 600),
                  duration: const Duration(milliseconds: 600),
                ),
                
                SizedBox(height: height * 0.03),
                
                // Description title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    Strings.description,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ).animate().fadeIn(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 600),
                ),
                
                SizedBox(height: height * 0.01),
                
                // Description text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.recipe.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                      height: 1.5,
                    ),
                  ),
                ).animate().fadeIn(
                  delay: const Duration(milliseconds: 1000),
                  duration: const Duration(milliseconds: 600),
                ),
                
                SizedBox(height: height * 0.04),
                
                // Delete button (if applicable)
                if (widget.delete == true)
                  Center(
                    child: InkWell(
                      onTap: () {
                        // Show confirmation dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Delete Course"),
                            content: const Text("Are you sure you want to delete this course?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("CANCEL"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  RecipeRepository.to.delete(widget.recipe);
                                  Navigator.pop(context); // Close dialog
                                  Navigator.pop(context); // Return to previous screen
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Text(
                                  "DELETE",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        height: 55,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.redAccent, Colors.red],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "DELETE COURSE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ).animate().fadeIn(
                    delay: const Duration(milliseconds: 1200),
                    duration: const Duration(milliseconds: 600),
                  ).scale(
                    delay: const Duration(milliseconds: 1200),
                    duration: const Duration(milliseconds: 600),
                  ),
                
                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoViewer extends StatelessWidget {
  final String name;
  final String amount;
  final IconData icon;
  
  const InfoViewer({
    super.key,
    required this.name,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
