import 'package:dating_app/message/message.dart';
import 'package:dating_app/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('My Profile'),
        centerTitle: true,
      ),
      body: homeBody(),
      bottomNavigationBar: BottomNavBar(activeIndex: 1),
    ));
  }

  homeBody() {
    return Builder(
        builder: (context) => Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/p1.jpg',
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.not_interested),
                        ),
                      )),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MessageScreen())),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(10),
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: const [
                              Text(
                                'Samantha, 24',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              ListTile(
                                leading: Icon(Icons.work),
                                title: Text(
                                  'Frontend developer at MTN Nigeria',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.location_on),
                                title: Text('Ikeja Lagos',
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          )))
                ],
              ),
            ));
  }
}
