import 'package:flutter/material.dart';
import 'package:chat_app/models/chat_message_entity.dart';

class ChatInput extends StatelessWidget {
  ChatInput({Key? key, required this.onSubmit}) : super(key: key);
  final Function(ChatMessageEntity) onSubmit;

  final TextEditingController chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    if (chatMessageController.text.trim().isEmpty) return;

    final newChatMessage = ChatMessageEntity(
      text: chatMessageController.text.trim(),
      id: "244",
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(userName: 'poojab26'),
    );

    onSubmit(newChatMessage);
    chatMessageController.clear(); // Clear input after sending
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              controller: chatMessageController,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Type your message",
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
