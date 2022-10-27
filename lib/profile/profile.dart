import 'package:dating_app/settings/settings.dart';
import 'package:dating_app/widgets/bottom_nav.dart';
import 'package:dating_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final List image = [
    'assets/images/p1.jpg',
    'assets/images/p2.jpg',
    'assets/images/p3.jpg',
    'assets/images/p4.jpg',
    'assets/images/p5.jpg',
    'assets/images/p6.jpg',
    'assets/images/p7.jpg',
    'assets/images/p8.jpg',
    'assets/images/p9.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () => Navigator.pop(context),
        //     icon: Icon(Icons.arrow_back_ios)),
        title: Text('My Profile'),
        centerTitle: true,
      ),
      drawer: SettingsDrawer(),
      body: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          Container(
            height: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/p6.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Samantha, 24',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('About me'),
          ),
          aboutMe(),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('My photos'),
          ),
          myPhotos(),
          Divider(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(activeIndex: 0),
    ));
  }

// profilePicture(){
//   return Container(
//     height: MediaQuery.of(context).size.width,
//   )
// }
  myPhotos() {
    return GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            '${image[index]}',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  aboutMe() {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 226, 223, 223),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Text(
                'I just live for happiness. I have plans and dream for my live and I do my best to get it'),
            SizedBox(
              height: 20,
            ),

            Row(children: const [
              Icon(Icons.work),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text('Frontend developer at MTN Nigeria'),
              ),
              SizedBox(
                height: 50,
              ),
            ]),
            Row(children: const [
              Icon(Icons.location_on),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text('Ikeja Lagos'),
              ),
            ]),
            // leading: Icon(Icons.work),
            // title:
            //   style: TextStyle(color: Colors.white),
            // ),
            // ),
            // ListTile(
            //   leading: Icon(Icons.location_on),
            //   title: Text('Ikeja Lagos', style: TextStyle(color: Colors.white)),
            // )
          ],
        ));
  }
}
