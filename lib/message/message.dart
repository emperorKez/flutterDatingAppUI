import 'package:dating_app/message/chat.dart';
import 'package:dating_app/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        // shrinkWrap: true,
        //physics: ClampingScrollPhysics(),
        //physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            color: Colors.white,
            height: 150,
            child: GridView.builder(
              //shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 1,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // height: 100,
                  // width: 100,
                  color: Colors.green,
                  child: activeOnline(),
                );
                
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                    title: Text('Monica'),
                    subtitle: Text('how are you today'),
                    trailing: Text('08:30 AM'),
                    tileColor: Colors.amberAccent,
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatScreen()),
                        ));
                //return massegeTile();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(activeIndex: 2),
    ));
  }

  Widget activeOnline() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        CircleAvatar(
          radius: 50,
        ),
        Text('Monalisa')
      ],
    );
  }
}

Widget massegeTile() {
  return Builder(
      builder: (context) => Card(
            child: ListTile(
                leading: CircleAvatar(
                    //radius: double.infinity,
                    ),
                title: Text('Monica'),
                subtitle: Text('how are you today'),
                trailing: Text('08:30 AM'),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    )),
          ));
}
