import 'dart:io';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:course_tracker/sql/sql.dart';
// import 'package:course_tracker/sql/sqllite.dart';
import 'package:course_tracker/model.dart/RecppeModel.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RecipeRepository extends GetxController {
  static RecipeRepository get to => Get.find();
  List<Course>? yourcourse;
  List<Course>? bestcourse;
  TextEditingController name = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController paidfee = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endData = TextEditingController();
  int index = 0;
  File? image;
  void delete(Course recipe) {
    yourcourse!.removeWhere((item) => item.id == recipe.id);
    update();
  }

  updatebestrecipe(List<Course> course) {
    bestcourse = course;
    update();
  }

  updateyourrecipe(List<Course> course) {
    yourcourse = course;
    update();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      update();
    }
  }

  Future<void> addRecipe(context) async {
    if (name.text.isNotEmpty &&
        des.text.isNotEmpty &&
        image != null &&
        paidfee.text.isNotEmpty &&
        startDate.text.isNotEmpty &&
        endData.text.isNotEmpty) {
      String id = DateTime.now().microsecond.toString();
      Course model = Course(
          id: id,
          name: name.text,
          description: des.text,
          imageUrl: image!.path,
          paid_fee: paidfee.text,
          startDate: startDate.text,
          endDate: endData.text);
          await SQL.post("INSERT INTO dbo.course VALUES  (${model.toMap()})").then((value) {
 Fluttertoast.showToast(
          msg: "Add Successfully !",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG,
        );
          });
      
       
       yourcourse!.add(model);
    
      cleardata();
    } else {
      Fluttertoast.showToast(
        msg: "Fill All Fields! !",
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
    name.clear();
    des.clear();
    des.clear();
    image = null;
    paidfee.clear();
    endData.clear();
    startDate.clear();
    update();
  }
}

