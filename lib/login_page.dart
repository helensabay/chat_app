import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  void loginUser() {
    print(userNameController.text);
    print(passwordController.text);

    print('Login successful!');
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                    letterSpacing: 0.5),
              ),
              Text(
                'Welcome back! \n You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
              Image.network(
                'https://images.unsplash.com/photo-1605749439419-80c81f67eefc?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zmxvd2VycyUyMGFlc3RoZXRpY3xlbnwwfHwwfHx8MA%3D%3D',
                height: 200,
              ),
              TextField(
                controller: userNameController,
                decoration: InputDecoration(
                    hintText: 'Add your username',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: OutlineInputBorder()),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Type your password',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: OutlineInputBorder()),
              ),
              ElevatedButton(
                  onPressed: loginUser,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  )),
              InkWell(
                splashColor: Colors.red,
                onDoubleTap: () {
                  print('double tapped!');
                },
                onLongPress: () {
                  print('onLongpress!');
                },
                onTap: () {
                  //TODO: Navigate to browser
                  print('Link clicked!');
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text('https://helebsabay.com'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
