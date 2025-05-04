import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:course_tracker/sql/sqllite.dart';
import 'package:course_tracker/screen/loginScreen.dart';
import 'package:course_tracker/screen/addfood.dart';
import 'package:course_tracker/screen/nev_bar/profile.dart';
import 'package:course_tracker/widget/constants/staticdata.dart';
import 'package:course_tracker/widget/constants/strings.dart';
import 'package:course_tracker/widget/theme/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            AppColors.background,
          ],
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Strings.settingsTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: AppColors.primary,
                  letterSpacing: 0.5,
                ),
              ).animate().fadeIn(duration: const Duration(milliseconds: 600)),
              
              const SizedBox(height: 30),
              
              // Profile card
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.8),
                      AppColors.primaryLight.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Hero(
                      tag: 'profile_image',
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                          image: DecorationImage(
                            image: FileImage(File(StaticData.model!.image)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${StaticData.model!.username}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            StaticData.model!.email,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 600),
              ).moveY(
                begin: 30,
                end: 0,
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOutQuad,
              ),
              
              const SizedBox(height: 30),
              
              // Settings options
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildSettingsTile(
                      context,
                      title: Strings.profileOption,
                      icon: CupertinoIcons.person,
                      iconColor: AppColors.primary,
                      backgroundColor: AppColors.primary.withOpacity(0.1),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Profile(),
                          ),
                        );
                      },
                      delay: 600,
                    ),
                    
                    Divider(color: Colors.grey.withOpacity(0.1), height: 1),
                    
                    _buildSettingsTile(
                      context,
                      title: Strings.addCourseOption,
                      icon: Icons.add_circle_outline,
                      iconColor: AppColors.accent,
                      backgroundColor: AppColors.accent.withOpacity(0.1),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddData(),
                          ),
                        );
                      },
                      delay: 800,
                    ),
                    
                    Divider(color: Colors.grey.withOpacity(0.1), height: 1),
                    
                    _buildSettingsTile(
                      context,
                      title: Strings.logoutOption,
                      icon: Icons.logout,
                      iconColor: Colors.red,
                      backgroundColor: Colors.red.withOpacity(0.1),
                      onTap: () {
                        _showLogoutDialog(context);
                      },
                      delay: 1000,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSettingsTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required Function() onTap,
    required int delay,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.textDark,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.textLight,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(
      delay: Duration(milliseconds: delay),
      duration: const Duration(milliseconds: 600),
    ).moveX(
      begin: 30,
      end: 0,
      delay: Duration(milliseconds: delay),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutQuad,
    );
  }
  
  // Logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout Confirmation"),
        content: const Text("Are you sure you want to log out?"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "CANCEL",
              style: TextStyle(color: AppColors.textMedium),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              StaticData.clearCredentials();
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "LOGOUT",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
