import 'dart:io';

import 'package:flutter/material.dart';
import 'package:course_tracker/controller/courseController.dart';
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
        body: Center(
          child: SizedBox(
            height: height,
            width: width * 0.9,
            child: ListView(children: [
              SizedBox(height: height * 0.05),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    SizedBox(width: width * 0.02),
                    const Icon(
                      Icons.west,
                      color: Colors.black,
                      size: 35,
                    ),
                    SizedBox(width: width * 0.25),
                    const Text(
                      "Add Course ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Align(
                alignment: Alignment.center,
                child: obj.image != null
                    ? CircleAvatar(
                        radius: 80,
                        // foregroundColor: Colors.white,
                        // backgroundColor: Colors.white,
                        backgroundImage: FileImage(
                          File(obj.image!.path),
                        ),
                        child: InkWell(
                          onTap: () {
                            obj.pickImage();
                          },
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              // backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.add,
                                // color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                    : CircleAvatar(
                      backgroundColor:  Colors.amber,
                        radius: 80,
                        child: InkWell(
                          onTap: () {
                            obj.pickImage();
                          },
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                      ),
              ),
              Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  height: height * 0.07,
                  child: TextField(
                    enableInteractiveSelection: false,
                    controller: obj.name,
                    cursorColor: Colors.black,
                    cursorRadius: const Radius.circular(10),
                    cursorHeight: 30,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      filled: false,
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none,
                      hintText: "  Name",
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                shadowColor: Colors.black,
                elevation: 10,
                child: SizedBox(
                  height: height * 0.07,
                  child: TextFormField(
                    controller: obj.des,
                    cursorColor: Colors.black,
                    cursorRadius: const Radius.circular(10),
                    cursorHeight: 30,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: "  Description",
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                shadowColor: Colors.black,
                elevation: 10,
                child: SizedBox(
                  height: height * 0.07,
                  child: TextFormField(
                    controller: obj.paidfee,
                    cursorColor: Colors.black,
                    cursorRadius: const Radius.circular(10),
                    cursorHeight: 30,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "  Fee",
                      filled: false,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                shadowColor: Colors.black,
                // shape: CircleBorder(),
                elevation: 10,
                child: SizedBox(
                  height: height * 0.07,
                  child: TextFormField(
                    controller: obj.startDate,
                    cursorColor: Colors.black,
                    cursorRadius: const Radius.circular(10),
                    cursorHeight: 30,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: "  Start Date",
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                shadowColor: Colors.black,
                // shape: CircleBorder(),
                elevation: 10,
                child: SizedBox(
                  height: height * 0.07,
                  child: TextFormField(
                    controller: obj.endData,
                    cursorColor: Colors.black,
                    cursorRadius: const Radius.circular(10),
                    cursorHeight: 30,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "  End Date",
                      filled: false,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    obj.addRecipe(context);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    shadowColor: Colors.black,
                    elevation: 10,
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color:  Colors.blue,
                      ),
                      child: const Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
            ]),
          ),
        ),
      );
    });
  }
}
