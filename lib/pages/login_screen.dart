import 'package:enhanzer/components/my_button.dart';
import 'package:enhanzer/components/my_dont_have.dart';
import 'package:enhanzer/components/my_text_field.dart';
import 'package:enhanzer/components/social_bar.dart';
import 'package:enhanzer/pages/Home_page.dart';
import 'package:enhanzer/pages/signup_page.dart';
import 'package:enhanzer/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:enhanzer/backend/api_service.dart';
import 'package:enhanzer/backend/database.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showMessage("Please enter username and password.");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    var response = await ApiService.login(username, password);

    setState(() {
      _isLoading = false;
    });

    if (response != null && response['Status_Code'] == 200) {
      DatabaseHelper().saveUser(response['Response_Body'][0]);
      _showMessage("Login Successful!");
      // Navigate to another screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      _showMessage("Login Failed!");
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text("Login Page",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0, right: 20, left: 20),
          child: Column(
            children: [
              Image.asset(
                'images/login.jpg',
                height: 300,
                width: 300,
              ),
              SizedBox(
                height: 15,
              ),
              // Username and password text fields
              MyTextField(
                controller: _usernameController,
                hintText: 'Enter your username',
                labelText: 'Username',
                icon: Icons.person,
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
                labelText: 'Password',
                icon: Icons.lock,
                obscureText: true,
              ),
              SizedBox(height: 20),
              // Login button
              MyButton(
                text: 'Login',
                isLoading: _isLoading,
                login: _login,
              ),
              Column(
                children: [
                  MyDontHave(
                    signup: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ),
                      );
                    },
                  ),
                  SocialBar(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
