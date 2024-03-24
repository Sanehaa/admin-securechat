import 'package:admin_securechat/constants/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:admin_securechat/constants/sc_color_theme.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final colorTheme = SCColorTheme();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 350,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: colorTheme.primaryColorBlue800,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/SecureChatlogo.png',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            SizedBoxes.verticalTiny,
            Text("ADMIN PORTAL",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorTheme.white
            ),
            ),
            SizedBoxes.verticalBig,
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: colorTheme.neutral300
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorTheme.primaryColorBlue500),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorTheme.primaryColorBlue500),
                ),
              ),
            ),
            SizedBoxes.verticalTiny,
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: colorTheme.neutral300
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorTheme.primaryColorBlue500),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorTheme.primaryColorBlue500),
                ),
              ),
            ),
            SizedBoxes.verticalTiny,
            ElevatedButton(
              onPressed: () {
                // Handle login button press
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

}
