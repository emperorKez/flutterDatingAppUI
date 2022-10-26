import 'package:flutter/material.dart';

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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('Chat'),
        centerTitle: true,
      ),
      bottomNavigationBar: bottomContainer(),
    ));
  }

  bottomContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      //height: 40,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.camera_enhance,
              color: Colors.blueAccent,
              size: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),

          Expanded(
              child: TextField(
            controller: _chatMessage,
            keyboardType: TextInputType.name,
            //maxLength: 100,
            decoration: InputDecoration(
                hintText: 'Start typing',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            onEditingComplete: (() {
              //
            }),
          )),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.send,
              color: Colors.blueAccent,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
