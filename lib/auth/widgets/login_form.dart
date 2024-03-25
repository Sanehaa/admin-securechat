import 'package:admin_securechat/constants/sized_boxes.dart';
import 'package:admin_securechat/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:admin_securechat/constants/sc_color_theme.dart';
import 'package:http/http.dart' as http;
import 'package:admin_securechat/configurations/config.dart';
import 'dart:convert';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final colorTheme = SCColorTheme();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  Future<void> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String username = _nameController.text;
    final String apiUrl = login;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'email': email,
          'password': password,
        }),
      );


      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      } else {
        print('Login failed');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 450,
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
            TextFormField(
              style: TextStyle(
                color: colorTheme.white,
              ),
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Username',
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
            TextFormField(
              style: TextStyle(
                color: colorTheme.white,
              ),
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
            TextFormField(
              style: TextStyle(
                color: colorTheme.white,
              ),
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
              onPressed: _login, // Call _login directly without wrapping with onPressed
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
