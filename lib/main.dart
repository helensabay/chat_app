import 'package:flutter/material.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/chat_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(primarySwatch: Colors.yellow),
      // 👇 Make sure LoginPage() is the starting screen
      home: LoginPage(),
      routes: {
        '/chat': (context) => ChatPage(),
      },
    );
  }
}
