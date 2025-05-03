// ignore_for_file: file_names, avoid_print

import 'package:fluttertoast/fluttertoast.dart';
import 'package:course_tracker/sql/sql.dart';
import 'package:course_tracker/widget/constants/staticdata.dart';
import 'package:course_tracker/model.dart/UserModel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future getUser(String email, String password) async {
    try {
      List<Map<String, dynamic>> users = await SQL.getUserByEmailAndPassword(email, password);
      
      if (users.isNotEmpty) {
        UserModel model = UserModel(
          username: users[0][SQL.colUsername],
          id: users[0][SQL.colUserId],
          email: users[0][SQL.colEmail],
          phone: users[0][SQL.colPhone],
          dob: users[0][SQL.colDob],
          image: users[0][SQL.colImage],
          password: users[0][SQL.colPassword],
        );

        StaticData.model = model;
        StaticData.id = model.id;
        update();
        StaticData.storeCredentials(email, password);
        cleardata();
      } else {
        Fluttertoast.showToast(
          msg: "User Not Found!",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } catch (e) {
      print("Error in login: $e");
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
  }

  cleardata() {
    email.clear();
    password.clear();
    update();
  }

  // Future<UserModel?> UpdateUser(String email, String password, context) async {
  //   print("dataaaa");
  //    String query = "UPDATE dbo.users SET ";
  //     query += "email = '$email'";
  //     query += "password = '$password'";

  //     query += " WHERE id = '${StaticData.model!.id}'";
    
  //       await SQL.Update(query);

  //       StaticData.model!.email=email;
  //       StaticData.model!.password=password;
  //   return null;
  // }
}
