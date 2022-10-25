
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  final List image = ['assets/images/p1.jpg', 'assets/images/p2.jpg', 'assets/images/p3.jpg', 'assets/images/p4.jpg', 'assets/images/p5.jpg', 'assets/images/p6.jpg', 'assets/images/p7.jpg', 'assets/images/p8.jpg', 'assets/images/p9.jpg'];

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
      body: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: [myPhotos()],
      ),
    ));
  }

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
          child: Image.asset('${image[index]}'),
        );
      },
    );
  }
}
