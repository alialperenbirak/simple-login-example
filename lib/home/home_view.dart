import 'package:flutter/material.dart';
import 'package:simple_login_example/core/auth_manager.dart';
import 'package:simple_login_example/core/cache_manager.dart';
import 'package:simple_login_example/home/model/user_model.dart';
import 'package:provider/src/provider.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with CacheManager {
  String token = '';
  late UserModel? userModel;

  Future<void> getTokenCache() async {
    token = await getToken() ?? '';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = context.read<AuthenticationManager>().model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${userModel?.name}')),
      body: CircleAvatar(
        backgroundImage: NetworkImage(userModel?.imageUrl ?? ''),
      ),
    );
  }
}
