import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repo/image_repository.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/chat_bubble.dart';
import 'package:chat_app/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = [];

  // Load mock messages
  _loadInitialMessages() async {
    final response = await rootBundle.loadString('assets/mock_messages.json');
    final List<dynamic> decodeList = jsonDecode(response) as List;

    final List<ChatMessageEntity> _chatMessages = decodeList.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }).toList();

    setState(() {
      _messages = _chatMessages;
    });
  }

  // Add new message
  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadInitialMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: FutureBuilder<String?>(
            future: context.read<AuthService>().getUserName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Hi...");
              } else if (snapshot.hasData && snapshot.data != null) {
                return Text("Hi ${snapshot.data}!");
              } else {
                return Text("Hi there!");
              }
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthService>().logoutUser();
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return FutureBuilder<String?>(
                  future: context.read<AuthService>().getUserName(),
                  builder: (context, snapshot) {
                    final isMe = _messages[index].author.userName ==
                        (snapshot.data ?? "");
                    return ChatBubble(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      entity: _messages[index],
                    );
                  },
                );
              },
            ),
          ),
          ChatInput(
            onSubmit: onMessageSent,
          ),
        ],
      ),
    );
  }
}
