// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:course_tracker/controller/signupController.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    
    _animationController.forward();
    
    Get.put(SignupController());
    super.initState();
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<SignupController>(initState: (state) {
        Get.put(SignupController());
      }, builder: (obj) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.purple.withOpacity(0.7),
              ],
            ),
            image: DecorationImage(
              image: const NetworkImage("https://images.unsplash.com/photo-1550439062-609e1531270e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.65),
                BlendMode.darken,
              ),
            ),
          ),
          child: Center(
            child: SizedBox(
              height: height,
              width: width * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.05),
                    
                    // Back button with animation
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 28,
                      ),
                    ).animate().fadeIn(duration: const Duration(milliseconds: 300))
                      .moveX(begin: -20, end: 0, duration: const Duration(milliseconds: 300)),
                    
                    SizedBox(height: height * 0.02),
                    
                    // Animated title
                    Center(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Create Account',
                            textStyle: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        totalRepeatCount: 1,
                      ),
                    ),
                    
                    Center(
                      child: const Text(
                        "Sign up for a free account",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ).animate().fadeIn(delay: const Duration(milliseconds: 500), 
                          duration: const Duration(milliseconds: 500)),
                    ),
                    
                    SizedBox(height: height * 0.04),
                    
                    // Username input with animation
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white30, width: 1),
                      ),
                      child: TextFormField(
                        controller: obj.username,
                        cursorColor: Colors.white,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_outline, color: Colors.white70),
                          hintText: "Username",
                          hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                        ),
                      ),
                    ).animate()
                      .fadeIn(delay: const Duration(milliseconds: 200), 
                          duration: const Duration(milliseconds: 500))
                      .moveX(begin: -30, end: 0, 
                          delay: const Duration(milliseconds: 200), 
                          duration: const Duration(milliseconds: 500)),
                    
                    // Password input with animation
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white30, width: 1),
                      ),
                      child: TextFormField(
                        controller: obj.password,
                        obscureText: true,
                        cursorColor: Colors.white,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock_outline, color: Colors.white70),
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                        ),
                      ),
                    ).animate()
                      .fadeIn(delay: const Duration(milliseconds: 300), 
                          duration: const Duration(milliseconds: 500))
                      .moveX(begin: 30, end: 0, 
                          delay: const Duration(milliseconds: 300), 
                          duration: const Duration(milliseconds: 500)),
                    
                    // Phone input with animation
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white30, width: 1),
                      ),
                      child: TextFormField(
                        controller: obj.phone,
                        cursorColor: Colors.white,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.phone_android, color: Colors.white70),
                          hintText: "Phone",
                          hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                        ),
                      ),
                    ).animate()
                      .fadeIn(delay: const Duration(milliseconds: 400), 
                          duration: const Duration(milliseconds: 500))
                      .moveX(begin: -30, end: 0, 
                          delay: const Duration(milliseconds: 400), 
                          duration: const Duration(milliseconds: 500)),
                    
                    // DOB input with animation
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white30, width: 1),
                      ),
                      child: TextFormField(
                        controller: obj.dob,
                        cursorColor: Colors.white,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.calendar_today, color: Colors.white70),
                          hintText: "Date of birth",
                          hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                        ),
                      ),
                    ).animate()
                      .fadeIn(delay: const Duration(milliseconds: 500), 
                          duration: const Duration(milliseconds: 500))
                      .moveX(begin: 30, end: 0, 
                          delay: const Duration(milliseconds: 500), 
                          duration: const Duration(milliseconds: 500)),
                    
                    // Email input with animation
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white30, width: 1),
                      ),
                      child: TextFormField(
                        controller: obj.email,
                        cursorColor: Colors.white,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email_outlined, color: Colors.white70),
                          hintText: "Email",
                          hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                        ),
                      ),
                    ).animate()
                      .fadeIn(delay: const Duration(milliseconds: 600), 
                          duration: const Duration(milliseconds: 500))
                      .moveX(begin: -30, end: 0, 
                          delay: const Duration(milliseconds: 600), 
                          duration: const Duration(milliseconds: 500)),
                    
                    SizedBox(height: height * 0.03),
                    
                    // Sign up button with animation
                    Center(
                      child: InkWell(
                        onTap: () {
                          obj.register(context);
                        },
                        child: Container(
                          width: width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF8E2DE2),
                                Color(0xFF4A00E0),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ).animate()
                        .fadeIn(delay: const Duration(milliseconds: 700), 
                            duration: const Duration(milliseconds: 500))
                        .scale(delay: const Duration(milliseconds: 700), 
                            duration: const Duration(milliseconds: 400)),
                    ),
                    
                    SizedBox(height: height * 0.02),
                    
                    // Terms and conditions text with animation
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            "By clicking Sign up you agree to the",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "following ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              const Text(
                                "Terms and Conditions",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFF4A00E0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ).animate().fadeIn(
                        delay: const Duration(milliseconds: 800), 
                        duration: const Duration(milliseconds: 500)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
