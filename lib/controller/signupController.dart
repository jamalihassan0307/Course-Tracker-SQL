// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:course_tracker/sql/sql.dart';
// import 'package:course_tracker/sql/sqllite.dart';
import 'package:course_tracker/screen/loginScreen.dart';
import 'package:get/get.dart';
import 'package:course_tracker/model.dart/UserModel.dart';
import 'package:course_tracker/widget/constants/staticdata.dart';

class SignupController extends GetxController {
  static SignupController get to => Get.find();

  TextEditingController username = TextEditingController();
  TextEditingController email =
      TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();



  @override
  void onInit() {
    
    super.onInit();
  }


  Future<void> register(BuildContext context) async {
   
   if (username.text.isNotEmpty &&
         email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        dob.text.isNotEmpty) {
      try {
        String id = DateTime.now().millisecondsSinceEpoch.toString();
        UserModel model = UserModel(
          password: password.text,
          image: await StaticData.assetToF("assets/images/download.png"),
          username: username.text,
          id: id,
          email: email.text,
          phone: phone.text,
          dob: dob.text,
        );

        await SQL.insertUser({
          SQL.colUserId: model.id,
          SQL.colUsername: model.username,
          SQL.colEmail: model.email,
          SQL.colPassword: model.password,
          SQL.colPhone: model.phone,
          SQL.colDob: model.dob,
          SQL.colImage: model.image,
        });

        StaticData.model = model;
        StaticData.id = id;
        update();
        clearField();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      } catch (e) {
        print("Error in registration: $e");
        Fluttertoast.showToast(
          msg: "An error occurred. Please try again later!",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "Please fill all fields!",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  void clearField() {
    username.clear();
    email.clear();
    password.clear();
    phone.clear();
    dob.clear();
  }
}
