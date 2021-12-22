import 'package:flutter/widgets.dart';
import 'package:simple_login_example/core/cache_manager.dart';
import 'package:simple_login_example/home/model/user_model.dart';

class AuthenticationManager extends CacheManager {
  BuildContext context;
  AuthenticationManager({
    required this.context,
  });

  bool isLogin = false;
  UserModel? model;

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}
