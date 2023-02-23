import 'package:flutter/material.dart';

import 'components/loginBody.dart';
import 'components/loginHeader.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            ),
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const LoginHeader(),
                LoginBody(
                  phoneController: phoneController,
                  passwordController: passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
