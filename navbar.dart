import 'package:careersuccess/adminlogin.dart';
import 'package:careersuccess/driveresult.dart';
import 'package:careersuccess/offcampus.dart';
import 'package:careersuccess/sugession.dart';
import 'package:flutter/material.dart';
import 'package:careersuccess/feedback.dart';
import 'package:careersuccess/userprofileview.dart';
import 'package:careersuccess/settings.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Admin'),
            accountEmail: Text('admin@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  ('lib/images/admin.png'),
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfilePage()));
              }),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              }),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback and help'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SupportChat()));
            },
          ),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => adminlogin()));
            },
          ),
        ],
      ),
    );
  }
}
