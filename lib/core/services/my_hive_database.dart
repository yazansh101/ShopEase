import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class MyHiveDatabase {
  // Initialize a singleton instance of our database class
  static final MyHiveDatabase _instance = MyHiveDatabase._internal();

  // Define a private constructor to prevent multiple instances of the class
  MyHiveDatabase._internal();

  // Declare the methods for getting a reference to and opening a Hive box
  Future<Box> _openBox(String boxName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    return Hive.openBox(boxName);
  }

  // Declare the method for adding an item to a Hive box
  Future<void> addToBox(String boxName, dynamic key, dynamic value) async {
    Box box = await _openBox(boxName);
    await box.put(key, value);
  }

  // Declare the method for getting an item from a Hive box
  Future<dynamic> getFromBox(String boxName, dynamic key) async {
    Box box = await _openBox(boxName);
    return box.get(key);
  }

  // Declare the method for updating an item in a Hive box
  Future<void> updateInBox(String boxName, dynamic key, dynamic value) async {
    Box box = await _openBox(boxName);
    await box.put(key, value);
  }

  // Declare the method for deleting an item from a Hive box
  Future<void> deleteFromBox(String boxName, dynamic key) async {
    Box box = await _openBox(boxName);
    await box.delete(key);
  }

  // Declare the method for getting all items in a Hive box
  Future<Map<dynamic, dynamic>> getAllFromBox(String boxName) async {
    Box box = await _openBox(boxName);
    return box.toMap();
  }

  // Declare the method for checking if an item exists in a Hive box
  Future<bool> existsInBox(String boxName, dynamic key) async {
    Box box = await _openBox(boxName);
    return box.containsKey(key);
  }

  // Declare the method for deleting all items in a Hive box
  Future<void> clearBox(String boxName) async {
    Box box = await _openBox(boxName);
    await box.clear();
  }

  // Declare the method for closing a Hive box
  Future<void> closeBox(String boxName) async {
    Box box = Hive.box(boxName);
    await box.close();
  }

  // Define a static getter for the singleton instance of our database class
  static MyHiveDatabase get instance => _instance;
}
