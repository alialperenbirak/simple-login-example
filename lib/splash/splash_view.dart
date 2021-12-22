import 'package:flutter/material.dart';
import 'package:simple_login_example/core/auth_manager.dart';
import 'package:simple_login_example/home/home_view.dart';
import 'package:simple_login_example/home/model/user_model.dart';
import 'package:simple_login_example/login/login.dart';
import 'package:provider/src/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> controlToApp() async {
    await readAuthManager.fetchUserLogin();
    if (readAuthManager.isLogin) {
      Future.delayed(Duration(seconds: 1));
      readAuthManager.model = UserModel.fake();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeView()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    }
  }

  AuthenticationManager get readAuthManager =>
      context.read<AuthenticationManager>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controlToApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
