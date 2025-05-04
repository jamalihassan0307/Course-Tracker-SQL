// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:course_tracker/controller/profileController.dart';
import 'package:course_tracker/widget/constants/staticdata.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    Get.put(ProfileController());
    ProfileController.to.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<ProfileController>(builder: (obj) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.purple.withOpacity(0.03),
              ],
            ),
          ),
          child: Center(
            child: SizedBox(
              height: height,
              width: width * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.05),
                    
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              size: 22,
                            ),
                          ),
                        ).animate().fadeIn(duration: const Duration(milliseconds: 300)),
                        
                        const Text(
                          "Profile Update",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A00E0),
                          ),
                        ).animate().fadeIn(
                          delay: const Duration(milliseconds: 200),
                          duration: const Duration(milliseconds: 500),
                        ),
                        
                        const SizedBox(width: 40),
                      ],
                    ),
                    
                    SizedBox(height: height * 0.03),
                    
                    // Profile image
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.white,
                            backgroundImage: obj.image == null
                                ? (StaticData.model != null && StaticData.model!.image.isNotEmpty)
                                    ? FileImage(File(StaticData.model!.image))
                                    : null
                                : FileImage(File(obj.image!.path)),
                            child: (obj.image == null && (StaticData.model == null || StaticData.model!.image.isEmpty))
                                ? const Icon(Icons.person, size: 80, color: Colors.purple)
                                : null,
                          ),
                        ).animate().scale(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeOutBack,
                        ),
                        
                        InkWell(
                          onTap: () {
                            obj.pickImage();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4A00E0),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ).animate().scale(
                          delay: const Duration(milliseconds: 500),
                          duration: const Duration(milliseconds: 500),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: height * 0.04),
                    
                    // Form fields
                    _buildFormField(
                      controller: obj.username,
                      icon: Icons.person_outline,
                      hint: "Username",
                      delay: 200,
                    ),
                    
                    _buildFormField(
                      controller: obj.password,
                      icon: Icons.lock_outline,
                      hint: "Password",
                      isPassword: true,
                      delay: 300,
                    ),
                    
                    _buildFormField(
                      controller: obj.phone,
                      icon: Icons.phone_android,
                      hint: "Phone Number",
                      delay: 400,
                    ),
                    
                    _buildFormField(
                      controller: obj.dob,
                      icon: Icons.calendar_today,
                      hint: "Date of Birth",
                      delay: 500,
                    ),
                    
                    _buildFormField(
                      controller: obj.email,
                      icon: Icons.email_outlined,
                      hint: "Email Address",
                      delay: 600,
                    ),
                    
                    SizedBox(height: height * 0.04),
                    
                    // Update button
                    InkWell(
                      onTap: () {
                        obj.updatedata(context);
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
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "UPDATE PROFILE",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1.2,
                              color: Colors.white,
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
        );
      }),
    );
  }
  
  Widget _buildFormField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    bool isPassword = false,
    required int delay,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIcon: Icon(
            icon,
            color: const Color(0xFF4A00E0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xFF4A00E0),
              width: 1.5,
            ),
          ),
        ),
      ),
    ).animate().fadeIn(
      delay: Duration(milliseconds: delay),
      duration: const Duration(milliseconds: 500),
    ).moveX(
      begin: delay % 200 == 0 ? -20 : 20,
      end: 0,
      delay: Duration(milliseconds: delay),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutQuad,
    );
  }
}
