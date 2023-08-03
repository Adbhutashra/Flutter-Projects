import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:testproject/Hive/user_model.dart';

class HiveDataStore {
  static const boxName = "userBox";

  static Box<UserModel> box = Hive.box<UserModel>(boxName);

  Future<void> addUser({required UserModel userModel}) async {
    await box.add(userModel);
  }

  Future<void> getUser({required String id}) async {
    await box.get(id);
  }

  Future<void> updateUser(
      {required int index, required UserModel userModel}) async {
    await box.putAt(index, userModel);
  }

  Future<void> deleteUser(
      {required int index, required BuildContext context}) async {
    await box.deleteAt(index);
    Navigator.pop(context);
  }
}
