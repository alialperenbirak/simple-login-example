import 'package:flutter/material.dart';
import 'package:simple_login_example/login/login_resources.dart';
import './login_view_model.dart';

class LoginView extends LoginViewModel with LoginResources {
  final EdgeInsets paddingLow = EdgeInsets.all(8.0);

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: paddingLow,
        child: Center(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: buildWrapFormBody(),
          ),
        ),
      ),
    );
  }

  Wrap buildWrapFormBody() {
    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.end,
      children: [
        TextFormField(
          controller: controllerEmail,
          decoration: InputDecoration(
              labelText: emailText, border: OutlineInputBorder()),
        ),
        TextFormField(
          controller: controllerPass,
          decoration: InputDecoration(
              labelText: passwordText, border: OutlineInputBorder()),
        ),
        FloatingActionButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              fetchUserLogin(controllerEmail.text, controllerPass.text);
            }
          },
          child: Icon(Icons.check),
        )
      ],
    );
  }
}
