// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
// import 'package:course_tracker/model.dart/RecppeModel.dart';
import 'package:course_tracker/controller/courseController.dart';
import 'package:course_tracker/widget/loaded_recipes_widget.dart';
import 'package:get/get.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<RecipeRepository>(
        initState: (state) {},
        builder: (obj) {
          return SizedBox(
            height: height,
            width: width,
            child: Center(
              child: SizedBox(
                height: height,
                width: width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.05),
                    Text(
                      "Eaten Food ",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Expanded(
                      child: obj.yourcourse == null || obj.yourcourse!.isEmpty
                          ? SizedBox(
                              height: height * 0.6,
                              width: width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image(
                                        height: height * 0.3,
                                        width: width * 0.5,
                                        image: const AssetImage(
                                            "assets/images/spaghetti.png")),
                                  ),
                                  Text(
                                    "No Data",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          : LoadedRecipesWidget(
                              delete: true,
                              recipes: obj.yourcourse!,
                            ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
