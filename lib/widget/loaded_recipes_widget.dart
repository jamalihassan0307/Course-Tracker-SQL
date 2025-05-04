// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:course_tracker/model.dart/RecppeModel.dart';
import 'package:course_tracker/screen/recipe_details_screen.dart';

class LoadedRecipesWidget extends StatefulWidget {
  final List<Course> recipes;
  final bool? delete;
  const LoadedRecipesWidget({
    super.key,
    required this.recipes,
    this.delete,
  });

  @override
  State<LoadedRecipesWidget> createState() => _LoadedRecipesWidgetState();
}

class _LoadedRecipesWidgetState extends State<LoadedRecipesWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: widget.recipes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailsScreen(
                  delete: widget.delete,
                  recipe: widget.recipes[index],
                ),
              ),
            );
          },
          child: RecipeCardWidget(
            recipe: widget.recipes[index],
            index: index,
          ),
        ).animate().fadeIn(
          duration: Duration(milliseconds: 600),
          delay: Duration(milliseconds: 100 * index),
        ).moveY(
          begin: 30,
          end: 0,
          duration: Duration(milliseconds: 600),
          delay: Duration(milliseconds: 100 * index),
          curve: Curves.easeOutQuad,
        );
      },
    );
  }
}

class RecipeCardWidget extends StatelessWidget {
  final Course recipe;
  final int index;
  
  RecipeCardWidget({
    super.key,
    required this.recipe,
    required this.index,
  });

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.27,
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Card(
        elevation: 5,
        shadowColor: Colors.purple.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.purple.withOpacity(0.05),
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 16),
              AnimatedImageWidget(
                imageUrl: recipe.imageUrl,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Course title
                      Text(
                        recipe.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A00E0),
                        ),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Course details
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: Color(0xFF4A00E0),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              recipe.endDate,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Course description
                      Text(
                        recipe.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      
                      const Spacer(),
                      
                      // Course fee
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Fee: ${recipe.paid_fee}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailsScreen(
                                    delete: false,
                                    recipe: recipe,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 18,
                              color: Color(0xFF4A00E0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedImageWidget extends StatelessWidget {
  final String imageUrl;
  AnimatedImageWidget({
    super.key,
    required this.imageUrl,
  });

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    
    return Hero(
      tag: imageUrl,
      child: Container(
        height: height * 0.15,
        width: width * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            File(imageUrl),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.purple,
                  size: 40,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
