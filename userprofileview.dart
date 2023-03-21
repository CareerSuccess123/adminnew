import 'package:flutter/material.dart';
import 'package:careersuccess/userprofileedit.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: ListView(
        children: [
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/admin.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0.0,
                  left: 16.0,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                        NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  left: 130.0,
                  child: Text(
                    'Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('admin@example.com'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                subtitle: Text('123-456-7890'),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text('Job role'),
                subtitle: Text('Placement Officer'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('College'),
                subtitle: Text('College of engineering thalassery'),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff42a7f9)),
                    ),
                    child: const Text('EDIT PROFILE'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfileEditScreen()));
                    },
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
