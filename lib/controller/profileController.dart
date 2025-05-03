import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:course_tracker/sql/sql.dart';
import 'package:course_tracker/model.dart/UserModel.dart';
import 'package:course_tracker/screen/home_screen.dart';
import 'package:course_tracker/widget/constants/staticdata.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  TextEditingController username =
      TextEditingController(text: StaticData.model!.username);
  TextEditingController email =
      TextEditingController(text: StaticData.model!.email);
  TextEditingController password =
      TextEditingController(text: StaticData.model!.password);
  TextEditingController phone =
      TextEditingController(text: StaticData.model!.phone);
  TextEditingController dob =
      TextEditingController(text: StaticData.model!.dob);
  File? image;
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      update();
    }
  }

  updatedata(context) async {
    if (username.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        dob.text.isNotEmpty) {
      try {
        UserModel model = UserModel(
          password: password.text,
          image: StaticData.model!.image,
          username: username.text,
          id: StaticData.model!.id,
          email: email.text,
          phone: phone.text,
          dob: dob.text,
        );

        await SQL.updateUser(StaticData.model!.id, {
          SQL.colUsername: model.username,
          SQL.colEmail: model.email,
          SQL.colPassword: model.password,
          SQL.colPhone: model.phone,
          SQL.colDob: model.dob,
          SQL.colImage: model.image,
        });

        StaticData.model = model;
        update();
        Fluttertoast.showToast(
          msg: "Update data Successfully!",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG,
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => true,
        );
      } catch (e) {
        print("Error updating profile: $e");
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

  initialize() {
    username =
        TextEditingController(text: StaticData.model!.username);
    email =
        TextEditingController(text: StaticData.model!.email);
    password =
        TextEditingController(text: StaticData.model!.password);
    phone =
        TextEditingController(text: StaticData.model!.phone);
    dob =
        TextEditingController(text: StaticData.model!.dob);
  }

  void clearField() {
    username.clear();
    email.clear();
    password.clear();
    phone.clear();
    dob.clear();
    image = null;
    update();
  }
}
