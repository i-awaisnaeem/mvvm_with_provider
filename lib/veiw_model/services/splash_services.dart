import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/UserModel.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/veiw_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuth(BuildContext context) async {
    getUserData().then((value) async {
      print(value.token);

      if (value.token == null || value.token!.isEmpty) {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.LoginScreen);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.HomeScreen);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
