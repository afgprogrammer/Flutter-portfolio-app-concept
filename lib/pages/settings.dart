import 'dart:async';

import 'package:day33/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<List> _settings = [
    ['Notifications', 'Turn on/off notifications', Icons.notifications_rounded, Colors.red[400]],
    ['Privacy', 'Privacy settings', Icons.lock, Colors.green[400]],
    ['Data', 'Data usage', Icons.data_usage, Colors.orange[400]],
    ['Help', 'Help and feedback', Icons.help_outline, Colors.blue[400]],
    ['Logout', 'Logout', Icons.exit_to_app, Colors.black],
  ];

  int activeStatus = 0;

  showLogoutDealog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            FlatButton(
              color: Colors.blueAccent,
              child: Text('Cancel', style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Settings', style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  FadeAnimation(1.2, CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/81.jpg'),
                  )),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(1.2, Text('Eduardo Hernandez', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                      SizedBox(height: 5,),
                      FadeAnimation(1.2, Text("Berkeley, California", style: TextStyle(color: Colors.grey, fontSize: 14),)),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                        }, 
                        icon: FadeAnimation(1, Icon(Icons.mode_edit_outline_outlined, color: Colors.grey,)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            FadeAnimation(1, Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
            )),
            SizedBox(height: 10,),
            Container(
              height: 500,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _settings.length,
                itemBuilder: (context, index) {
                  return FadeAnimation((1.0 + index) / 4, settingsOption(_settings[index][0], _settings[index][1], _settings[index][2], _settings[index][3]));
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  settingsOption(String title, String subtitle, IconData icon, Color color) {
    return ListTile(
      onTap: () {
        if (title == 'Logout') {
          showLogoutDealog();
        }
      },
      subtitle: Text(subtitle),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Icon(icon, color: Colors.white, size: 30,),
      ),
      title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey.shade400,),
    );
  }
}
