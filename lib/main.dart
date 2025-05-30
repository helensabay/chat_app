import 'package:flutter/material.dart';
import 'services/auth_service.dart'; // adjust if path is different
import 'login_page.dart'; // your custom login screen
import 'chat_page.dart'; // your main chat screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init(); // Must be called before runApp

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<bool>(
        future: AuthService().isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData && snapshot.data!) {
            return ChatPage(); // already logged in
          } else {
            return LoginPage(); // needs to login
          }
        },
      ),
    );
  }
}
