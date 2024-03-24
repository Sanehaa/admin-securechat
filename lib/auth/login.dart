import 'package:admin_securechat/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:admin_securechat/constants/constants_exports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = SCColorTheme();
    return Scaffold(
      backgroundColor: colorTheme.primaryColorBlue600,
      body: const Center(
        child: LoginForm(),
      ),
    );
  }
}
