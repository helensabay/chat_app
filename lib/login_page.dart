import 'package:flutter/material.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:chat_app/widgets/login_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser(BuildContext context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
      print('login! successful!');
    } else {
      print('not successful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    'Let\'s sign you in!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Welcome back! \nYou\'ve been missed!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.network(
                    'https://images.unsplash.com/photo-1605749439419-80c81f67eefc?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zmxvd2VycyUyMGFlc3RoZXRpY3xlbnwwfHwwfHx8MA%3D%3D',
                    height: 200,
                  ),
                  const SizedBox(height: 24),
                  LoginTextField(
                    hintText: "Enter your username",
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length < 5) {
                        return "Your username should be more than 5 characters";
                      } else if (value != null && value.isEmpty) {
                        return "Please type your username";
                      }
                      return null;
                    },
                    controller: userNameController,
                  ),
                  const SizedBox(height: 24),
                  LoginTextField(
                    hasAsterisks: true,
                    controller: passwordController,
                    hintText: 'Enter your password',
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => loginUser(context),
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(height: 24),
                  InkWell(
                    splashColor: Colors.red,
                    onDoubleTap: () {
                      print('double tapped!');
                    },
                    onLongPress: () {
                      print('onLongpress!');
                    },
                    onTap: () {
                      print('Link clicked!');
                    },
                    child: const Column(
                      children: [
                        Text('Find us on'),
                        Text('https://helensabay.com'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
