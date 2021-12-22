import 'package:dio/dio.dart';
import 'package:simple_login_example/core/auth_manager.dart';
import 'package:simple_login_example/core/cache_manager.dart';
import 'package:simple_login_example/home/home_view.dart';
import 'package:simple_login_example/home/model/user_model.dart';
import 'package:simple_login_example/login/model/user_request_model.dart';
import 'package:simple_login_example/login/service/login_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/src/provider.dart';

import './login.dart';
import 'package:flutter/material.dart';

abstract class LoginViewModel extends State<Login> with CacheManager {
  late final LoginService loginService;
  final _baseUrl = 'https://reqres.in';
  @override
  void initState() {
    super.initState();
    final dio = Dio(BaseOptions(baseUrl: _baseUrl));
    dio.interceptors.add(PrettyDioLogger());
    loginService = LoginService(dio);
  }

  Future<void> fetchUserLogin(String email, String password) async {
    final response = await loginService
        .fetchLogin(UserRequestModel(email: email, password: password));

    if (response != null) {
      saveToken(response.token ?? '');
      navigateToHome();
      context.read<AuthenticationManager>().model = UserModel.fake();
    }
  }

  void navigateToHome() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeView()));
  }
}
