import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _chatMessage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: bottomContainer(),
    ));
  }

  bottomContainer() {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.camera_enhance),
            ),
          ),
           Expanded(
            flex: 8,
            child: TextField(
              controller: _chatMessage,
              
              decoration: InputDecoration(
                hintText: 'Start typing',
                

              ),
            )
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.send),
            ),
          )
        ],
      ),
    );
  }
}
