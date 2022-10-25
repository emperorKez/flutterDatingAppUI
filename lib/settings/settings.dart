import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool showProfile = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          ListTile(
            title: Text('Discovery'),
          ),
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
            title: Text('Notifications'),
          ),
        ],
      ),
    ));
  }
}
