import 'dart:io';

import 'package:flutter/material.dart';
import 'package:course_tracker/controller/courseController.dart';
import 'package:course_tracker/widget/constants/strings.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  void initState() {
    Get.put(RecipeRepository());
    super.initState();
  }

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<RecipeRepository>(builder: (obj) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              height: height,
              width: width * 0.9,
              child: Form(
                key: form,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      SizedBox(height: height * 0.02),
                      
                      // Header with back button
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Color(0xFF4A00E0),
                                size: 20,
                              ),
                            ),
                          ).animate().fadeIn(duration: const Duration(milliseconds: 300)),
                          
                          const Spacer(),
                          
                          Text(
                            Strings.addCourseTitle,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4A00E0),
                            ),
                          ).animate().fadeIn(
                            delay: const Duration(milliseconds: 200), 
                            duration: const Duration(milliseconds: 500),
                          ),
                          
                          const Spacer(),
                        ],
                      ),
                      
                      SizedBox(height: height * 0.03),
                      
                      // Course image selection
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            obj.pickImage();
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade100,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.purple.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                  image: obj.image != null
                                      ? DecorationImage(
                                          image: FileImage(File(obj.image!.path)),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: obj.image == null
                                    ? const Icon(
                                        Icons.image,
                                        size: 50,
                                        color: Colors.grey,
                                      )
                                    : null,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4A00E0),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ).animate().scale(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOutBack,
                        ),
                      ),
                      
                      SizedBox(height: height * 0.04),
                      
                      // Form fields
                      _buildTextField(
                        controller: obj.name,
                        hint: Strings.courseNameHint,
                        icon: Icons.class_outlined,
                        delay: 200,
                      ),
                      
                      _buildTextField(
                        controller: obj.des,
                        hint: Strings.courseDescriptionHint,
                        icon: Icons.description_outlined,
                        maxLines: 3,
                        delay: 300,
                      ),
                      
                      _buildTextField(
                        controller: obj.paidfee,
                        hint: Strings.courseFeeHint,
                        icon: Icons.attach_money,
                        keyboardType: TextInputType.number,
                        delay: 400,
                      ),
                      
                      _buildTextField(
                        controller: obj.startDate,
                        hint: Strings.courseStartDateHint,
                        icon: Icons.calendar_today,
                        delay: 500,
                      ),
                      
                      _buildTextField(
                        controller: obj.endData,
                        hint: Strings.courseEndDateHint,
                        icon: Icons.event_available,
                        delay: 600,
                      ),
                      
                      SizedBox(height: height * 0.04),
                      
                      // Add button
                      Center(
                        child: InkWell(
                          onTap: () {
                            if (form.currentState!.validate()) {
                              obj.addRecipe(context);
                            }
                          },
                          child: Container(
                            height: 55,
                            width: width * 0.6,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                              ),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purple.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                "ADD COURSE",
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
                        delay: const Duration(milliseconds: 700),
                        duration: const Duration(milliseconds: 500),
                      ).moveY(
                        begin: 20,
                        end: 0,
                        delay: const Duration(milliseconds: 700),
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOutQuad,
                      ),
                      
                      SizedBox(height: height * 0.05),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
  
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType? keyboardType,
    required int delay,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontSize: 16,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade50,
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: const Color(0xFF4A00E0),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF4A00E0), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade300),
          ),
        ),
      ),
    ).animate().fadeIn(
      delay: Duration(milliseconds: delay),
      duration: const Duration(milliseconds: 500),
    ).moveX(
      begin: delay % 200 == 0 ? -30 : 30,
      end: 0,
      delay: Duration(milliseconds: delay),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutQuad,
    );
  }
}
