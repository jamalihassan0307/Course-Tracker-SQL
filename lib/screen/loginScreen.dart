// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:course_tracker/controller/loginController.dart';
import 'package:course_tracker/controller/courseController.dart';
import 'package:course_tracker/model.dart/RecppeModel.dart';
import 'package:course_tracker/screen/SignupScreen.dart';
import 'package:course_tracker/screen/home_screen.dart';
import 'package:course_tracker/widget/constants/staticdata.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    
    _animationController.forward();
    
    Get.put(LoginController());
    Get.put(RecipeRepository());

    StaticData.retrieveCredentials(context);
    getdata();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  getdata() async {
    RecipeRepository.to.bestcourse = await loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (obj) {
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
              image: const NetworkImage("https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.15),
                    
                    // Animated logo or icon
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.school,
                          size: 60,
                          color: Colors.white,
                        ),
                      ).animate()
                        .scale(duration: 600.ms, curve: Curves.easeOutBack)
                        .fadeIn(duration: 700.ms),
                    ),
                    
                    SizedBox(height: height * 0.03),
                    
                    // Animated text title
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Course Tracker',
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
                    
                    SizedBox(height: height * 0.01),
                    
                    const Text(
                      "Login to your account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                    
                    SizedBox(height: height * 0.05),
                    
                    // Email field with animation
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
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
                      .fadeIn(delay: 300.ms, duration: 500.ms)
                      .moveX(begin: -50, end: 0, delay: 300.ms, duration: 500.ms),
                    
                    // Password field with animation
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
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
                      .fadeIn(delay: 500.ms, duration: 500.ms)
                      .moveX(begin: 50, end: 0, delay: 500.ms, duration: 500.ms),
                    
                    SizedBox(height: height * 0.03),
                    
                    // Login button with animation
                    InkWell(
                      onTap: () {
                        obj.getUser(
                          obj.email.text,
                          obj.password.text,
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => true,
                        );
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
                            "LOGIN",
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
                      .fadeIn(delay: 700.ms, duration: 500.ms)
                      .scale(delay: 700.ms, duration: 400.ms),
                    
                    SizedBox(height: height * 0.03),
                    
                    // Sign up row with animation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have account?",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const SignUp(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  var begin = const Offset(1.0, 0.0);
                                  var end = Offset.zero;
                                  var curve = Curves.easeInOut;
                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  return SlideTransition(position: animation.drive(tween), child: child);
                                },
                              ),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF4A00E0),
                            ),
                          ),
                        ),
                      ],
                    ).animate()
                      .fadeIn(delay: 900.ms, duration: 500.ms),
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
