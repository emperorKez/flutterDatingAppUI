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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('Messages'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            height: 100,
            child: GridView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 1,
                  childAspectRatio: 1.25),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return activeOnline(index);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                int i = index + 1;
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white10,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  height: 80,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/thumbnail-$i.jpg'),
                        radius: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ListTile(
                            title: Text('Monica'),
                            subtitle: Text('how are you today'),
                            trailing: Text('08:30 AM'),
                            contentPadding: EdgeInsets.zero,
                            onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatScreen()),
                                )),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(activeIndex: 2),
    ));
  }

  Widget activeOnline(i) {
    i = i + 1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/thumbnail-$i.jpg'),
            maxRadius: 50,
          ),
        ),
        SizedBox(
          height: 5,
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
