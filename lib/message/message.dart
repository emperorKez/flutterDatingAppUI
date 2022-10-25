import 'package:dating_app/message/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return activeOnline();
          },
        ),
        SizedBox(
          height: 25,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return massegeTile();
          },
        ),
      ],
    );
  }

  Widget activeOnline() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: const [
        CircleAvatar(
          radius: double.infinity,
        ),
        Text('Monalisa')
      ],
    );
  }
}

Widget massegeTile() {
  return Builder(
      builder: (context) => ListTile(
          leading: CircleAvatar(
            radius: double.infinity,
          ),
          title: Text('Monica'),
          subtitle: Text('how are you today'),
          trailing: Text('08:30 AM'),
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              )));
}
