import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:course_tracker/screen/loginScreen.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    
    _controller.forward();
    
    // Navigate to login screen after animation completes
    Timer(const Duration(milliseconds: 4500), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 800),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1A237E),
              const Color(0xFF4A148C),
              Colors.purple.shade900,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background decoration elements
            Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
            Positioned(
              bottom: -80,
              right: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
            
            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo with animation
                  ScaleTransition(
                    scale: _animation,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.5),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.school,
                          size: 70,
                          color: Colors.purple.shade900,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Animated app name
                  AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                        'Course Tracker',
                        textStyle: const TextStyle(
                          fontSize: 40, 
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        duration: const Duration(milliseconds: 1500),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // Animated tagline
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Track your learning journey with ease',
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            letterSpacing: 1.2,
                          ),
                          speed: const Duration(milliseconds: 80),
                        ),
                      ],
                      totalRepeatCount: 1,
                      isRepeatingAnimation: false,
                      displayFullTextOnTap: true,
                    ),
                  ),
                  
                  const SizedBox(height: 50),
                  
                  // Loading indicator
                  SizedBox(
                    width: width * 0.4,
                    child: const LinearProgressIndicator(
                      backgroundColor: Colors.white24,
                      color: Colors.white,
                      minHeight: 5,
                    ),
                  ),
                ],
              ),
            ),
            
            // Footer text
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: FadeTransition(
                  opacity: _animation,
                  child: const Text(
                    "© 2023 Course Tracker",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 