import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// import 'package:flutter/material.dart';

class SQL {
  static Database? _database;
  static const String _dbName = 'course_tracker.db';
  static const int _dbVersion = 1;

  // Tables
  static const String tableUsers = 'users';
  static const String tableCourses = 'courses';

  // User table columns
  static const String colUserId = 'id';
  static const String colUsername = 'username';
  static const String colEmail = 'email';
  static const String colPassword = 'password';
  static const String colPhone = 'phone';
  static const String colDob = 'dob';
  static const String colImage = 'image';

  // Course table columns
  static const String colCourseId = 'id';
  static const String colCourseName = 'name';
  static const String colDescription = 'description';
  static const String colImageUrl = 'imageUrl';
  static const String colPaidFee = 'paid_fee';
  static const String colStartDate = 'startDate';
  static const String colEndDate = 'endDate';

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    // Create users table
    await db.execute('''
      CREATE TABLE $tableUsers (
        $colUserId TEXT PRIMARY KEY,
        $colUsername TEXT NOT NULL,
        $colEmail TEXT NOT NULL,
        $colPassword TEXT NOT NULL,
        $colPhone TEXT NOT NULL,
        $colDob TEXT NOT NULL,
        $colImage TEXT NOT NULL
      )
    ''');

    // Create courses table
    await db.execute('''
      CREATE TABLE $tableCourses (
        $colCourseId TEXT PRIMARY KEY,
        $colCourseName TEXT NOT NULL,
        $colDescription TEXT NOT NULL,
        $colImageUrl TEXT NOT NULL,
        $colPaidFee TEXT NOT NULL,
        $colStartDate TEXT NOT NULL,
        $colEndDate TEXT NOT NULL
      )
    ''');
  }

  // User operations
  static Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert(tableUsers, user);
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query(tableUsers);
  }

  static Future<List<Map<String, dynamic>>> getUserByEmailAndPassword(
      String email, String password) async {
    final db = await database;
    return await db.query(
      tableUsers,
      where: '$colEmail = ? AND $colPassword = ?',
      whereArgs: [email, password],
    );
  }

  static Future<void> updateUser(String id, Map<String, dynamic> user) async {
    final db = await database;
    await db.update(
      tableUsers,
      user,
      where: '$colUserId = ?',
      whereArgs: [id],
    );
  }

  // Course operations
  static Future<void> insertCourse(Map<String, dynamic> course) async {
    final db = await database;
    await db.insert(tableCourses, course);
  }

  static Future<List<Map<String, dynamic>>> getCourses() async {
    final db = await database;
    return await db.query(tableCourses);
  }

  static Future<void> deleteCourse(String id) async {
    final db = await database;
    await db.delete(
      tableCourses,
      where: '$colCourseId = ?',
      whereArgs: [id],
    );
  }
}
