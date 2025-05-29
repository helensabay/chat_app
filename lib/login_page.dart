import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:chat_app/utils/spaces.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String _mainUrl = "https://poojabhaumik.com";

  void loginUser(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
      print('Login successful!');
    } else {
      print('Login failed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Let\'s sign you in!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpacing(16),
                Text(
                  'Welcome back! \nYou\'ve been missed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
                verticalSpacing(24),
                Image.asset(
                  'assets/illustration.png',
                  height: 200,
                ),
                verticalSpacing(24),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LoginTextField(
                        hintText: "Enter your username",
                        controller: userNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please type your username";
                          } else if (value.length < 5) {
                            return "Username must be at least 5 characters";
                          }
                          return null;
                        },
                      ),
                      verticalSpacing(16),
                      LoginTextField(
                        hintText: "Enter your password",
                        controller: passwordController,
                        hasAsterisks: true,
                      ),
                    ],
                  ),
                ),
                verticalSpacing(24),
                ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                verticalSpacing(16),
                InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse(_mainUrl);
                    if (!await launchUrl(url,
                        mode: LaunchMode.externalApplication)) {
                      throw 'Could not launch $_mainUrl';
                    }
                  },
                  child: Column(
                    children: [
                      Text('Find us on'),
                      Text(
                        _mainUrl,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
