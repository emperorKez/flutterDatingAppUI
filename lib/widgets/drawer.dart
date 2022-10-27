import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  bool showProfile = true;
  bool notification = true;
  double distance = 10;
  SfRangeValues ageRange = SfRangeValues(18, 50);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          DrawerHeader(
              //decoration: BoxDecoration(color: Colors.amber),
              child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                    maxRadius: 80,
                    backgroundImage: AssetImage(
                      'assets/images/thumbnail-1.jpg',
                    )),
              ),
              IconButton(
                  onPressed: (() {}),
                  icon: Icon(
                    Icons.photo_camera,
                    color: Colors.blueAccent,
                  ))
            ],
          )),
          // ListTile(
          //   title: Text('Discovery'),
          // ),
          SwitchListTile(
              title: Text('Show me on Instadating'),
              value: showProfile,
              onChanged: (value) {
                setState(() {
                  showProfile = value;
                });
              }),
          ListTile(
            title: Text('Distance Radius'),
            subtitle: SfSlider(
              min: 0,
              max: 100,
              value: distance,
              interval: 10,
              //stepSize: 1,
              //showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 0,
              onChanged: (dynamic value) {
                setState(() {
                  distance = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Gender'),
            trailing: Text('Female'),
          ),
          ListTile(
            title: Text('Gender Preference'),
            trailing: Text('Male'),
          ),
          ListTile(
            title: Text('Age Preference'),
            subtitle: SfRangeSlider(
              min: 0.0,
              max: 50,
              values: ageRange,
              //stepSize: 1,
              //interval: 20,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              thumbShape: SfThumbShape(),
              tooltipShape: SfPaddleTooltipShape(),
              //shouldAlwaysShowTooltip: true,
              onChanged: (SfRangeValues values) {
                setState(() {
                  ageRange = values;
                });
              },
            ),
          ),
          SwitchListTile(
              title: Text('Notifications'),
              value: notification,
              onChanged: (value) {
                setState(() {
                  notification = value;
                });
              }),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text('Logout'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
