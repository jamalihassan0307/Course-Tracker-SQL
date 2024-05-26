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



  String flutter = (await StaticData.assetToFile("assets/images/flutter.png")).path;
  String java = (await StaticData.assetToFile("assets/images/java.png")).path;
  String cplusplus = (await StaticData.assetToFile("assets/images/cplus.png")).path;
  String python = (await StaticData.assetToFile("assets/images/pythen.png")).path;
  String webdeveiopment = (await StaticData.assetToFile("assets/images/webdeveiopment.jfif")).path;
  String andriod_development_with_kotline = (await StaticData.assetToFile("assets/images/andriod_development_with_kotline.jfif")).path;
  String machine_Learning_with_Python = (await StaticData.assetToFile("assets/images/machine_Learning_with_Python.jfif")).path;
  String html_CSS_JavaScript = (await StaticData.assetToFile("assets/images/html_CSS_JavaScript.jfif")).path;
  String sql_for_Data_Analysis = (await StaticData.assetToFile("assets/images/sql_for_Data_Analysis.png")).path;

  List<Course> makeCourses = [
    Course(
      id: "1",
      name: "Flutter Development",
      description: "Learn to build beautiful native apps with Flutter.",
      imageUrl: flutter,
      paid_fee: "650",
      startDate: "35",
      endDate: "60",
    ),
    Course(
      id: "2",
      name: "Java Programming",
      description: "Master Java programming from basics to advanced.",
      imageUrl: java,
      paid_fee: "550",
      startDate: "45",
      endDate: "30",
    ),
    Course(
      id: "3",
      name: "C++ for Beginners",
      description: "An introductory course to C++ programming.",
      imageUrl: cplusplus,
      paid_fee: "250",
      startDate: "10",
      endDate: "10",
    ),
    Course(
      id: "4",
      name: "Python for Data Science",
      description: "Learn Python and its applications in Data Science.",
      imageUrl: python,
      paid_fee: "500",
      startDate: "20",
      endDate: "20",
    ),
    Course(
      id: "5",
      name: "Web Development with React",
      description: "Build modern web applications using React.",
      imageUrl: webdeveiopment,
      paid_fee: "800",
      startDate: "15",
      endDate: "15",
    ),
    Course(
      id: "6",
      name: "Android Development with Kotlin",
      description: "Create Android apps using Kotlin.",
      imageUrl: andriod_development_with_kotline,
      paid_fee: "700",
      startDate: "20",
      endDate: "40",
    ),
    Course(
      id: "7",
      name: "Machine Learning with Python",
      description: "Introduction to machine learning using Python.",
      imageUrl: machine_Learning_with_Python,
      paid_fee: "650",
      startDate: "25",
      endDate: "15",
    ),
    Course(
      id: "8",
      name: "HTML, CSS, and JavaScript",
      description: "Learn to build websites using HTML, CSS, and JavaScript.",
      imageUrl: html_CSS_JavaScript,
      paid_fee: "200",
      startDate: "3",
      endDate: "30",
    ),
    Course(
      id: "9",
      name: "SQL for Data Analysis",
      description: "Master SQL and its applications in data analysis.",
      imageUrl: sql_for_Data_Analysis,
      paid_fee: "450",
      startDate: "25",
      endDate: "30",
    ),
  ];
 
  return makeCourses;
}

