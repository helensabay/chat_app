import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void loginUser() {
    print('Login successful!');
  }

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
              ElevatedButton(
                  onPressed: loginUser,
                  child: Text(
                    'Click me!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
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
                    Text('https://helensabay.com'),
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
