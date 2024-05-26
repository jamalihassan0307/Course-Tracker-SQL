// ignore_for_file: file_names

// import 'dart:convert';

import 'package:course_tracker/widget/constants/staticdata.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Course {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String paid_fee;
  final String startDate;
  final String endDate;
  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.paid_fee,
    required this.startDate,
    required this.endDate,
  });

  

 String toMap() {
    return "'$id','$name','$description','$imageUrl','$paid_fee','$startDate','$endDate'";

  }

  factory Course.fromMap( map) {
    return Course(
      id: map['id'] ,
      name: map['name'] ,
      description: map['description'] ,
      imageUrl: map['imageUrl'] ,
      paid_fee: map['paid_fee'] ,
      startDate: map['startDate'] ,
      endDate: map['endDate'] ,
    );
  }

 
}

Future<List<Course>> loadRecipes() async {
  String spaghettiImagePath =
      (await StaticData.assetToFile("assets/images/spaghetti.png")).path;

  List<Course> makeRecipes = [
    Course(
      id: "1",
      name: "Spaghetti Bolognese",
      description: "A classic Italian meat sauce served over pasta",
      imageUrl: spaghettiImagePath,
      paid_fee: "650",
      startDate: "35",
      endDate: "60",
    ),
    Course(
      id: "2",
      name: "Chicken Parmesan",
      description:
          "Breaded chicken breast topped with tomato sauce and mozzarella",
      imageUrl:
          (await StaticData.assetToFile("assets/images/chicken.png")).path,
      paid_fee: "550",
      startDate: "45",
      endDate: "30",
    ),
    Course(
      id: "3",
      name: "Caesar Salad",
      description:
          "Romaine lettuce with creamy Caesar dressing, croutons and parmesan",
      imageUrl: (await StaticData.assetToFile("assets/images/salad.png")).path,
      paid_fee: "250",
      startDate: "10",
      endDate: "10",
    ),
    Course(
      id: "4",
      name: "Tacos",
      description:
          "Soft tortilla shells filled with seasoned ground beef, lettuce, cheese and salsa",
      imageUrl: (await StaticData.assetToFile("assets/images/tacos.png")).path,
      paid_fee: "500",
      startDate: "20",
      endDate: "20",
    ),
    Course(
      id: "5",
      name: "Pasta Alfredo",
      description:
          "Fettuccine pasta tossed in a rich, creamy parmesan cheese sauce",
      imageUrl:
          (await StaticData.assetToFile("assets/images/alfredo.png")).path,
      paid_fee: "800",
      startDate: "15",
      endDate: "15",
    ),
    Course(
      id: "6",
      name: "Cheese Pizza",
      description: "Crispy crust with tomato sauce and mozzarella cheese",
      imageUrl: (await StaticData.assetToFile("assets/images/pizza.png")).path,
      paid_fee: "700",
      startDate: "20",
      endDate: "40",
    ),
    Course(
      id: "7",
      name: "Hamburger",
      description:
          "Juicy beef patty with lettuce, tomato, onion and cheese on a bun",
      imageUrl: (await StaticData.assetToFile("assets/images/burger.png")).path,
      paid_fee: "650",
      startDate: "25",
      endDate: "15",
    ),
    Course(
      id: "8",
      name: "Chocolate Chip Cookies",
      description: "Chewy cookies filled with chocolate chips",
      imageUrl:
          (await StaticData.assetToFile("assets/images/cookies.png")).path,
      paid_fee: "200",
      startDate: "3",
      endDate: "30",
    ),
    Course(
      id: "9",
      name: "Chicken Fried Rice",
      description: "Rice stir-fried with chicken, vegetables and egg",
      imageUrl: (await StaticData.assetToFile("assets/images/rice.png")).path,
      paid_fee: "450",
      startDate: "25",
      endDate: "30",
    ),
  ];
 
  return makeRecipes;
}

