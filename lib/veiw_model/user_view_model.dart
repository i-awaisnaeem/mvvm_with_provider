import 'package:flutter/material.dart';
import 'package:mvvm/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token ?? '');
    print('Token saved: ${user.token}');
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    print('Token retrieved: $token');
    return UserModel(
      token: token,
    );
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove('token');
    return true;
  }
}
