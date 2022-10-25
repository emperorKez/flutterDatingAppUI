import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: homeBody(),
    ));
  }

  homeBody() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset('assets/images/p8.jpg'),
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
                child: Icon(Icons.favorite),
              ),
            )),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(10),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: const [
                  Text('Samantha, 24', style: TextStyle(
                    fontSize: 20
                  ),),
                  ListTile(
                    leading: Icon(Icons.work),
                    title: Text('Frontend developer at MTN Nigeria'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Ikeja Lagos'),
                  )

                ],
              )
            ))
        ],
      ),
    );
  }
}
