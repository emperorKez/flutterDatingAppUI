import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dating_app/message/message.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home/home_screen.dart';
import '../profile/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.activeIndex}) : super(key: key);
  final int activeIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: widget.activeIndex,
      backgroundColor: Colors.blueAccent,
      height: 50,
      animationCurve: Curves.easeOutCubic,
      items: const <Widget>[
        Icon(Icons.person, size: 30),
        Icon(Icons.hot_tub, size: 30),
        Icon(FontAwesomeIcons.message, size: 30),
      ],
      onTap: (index) {
        setState(() {
          switch (index) {
            case 0:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));

              break;
              case 1:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));

              break;
              case 2:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MessageScreen()));

              break;
            default:
          }
        });
        //Handle button tap
      },
    );
  }
}
