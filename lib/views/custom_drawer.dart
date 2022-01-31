import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // color: Colors.green,
      child: ListView(
        children: [
          ListTile(
            title: Text('Profile'),
            subtitle: Text('03085401482'),
            leading: Icon(
              Icons.person,
              size: 40,
              color: Colors.green,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.green,
            ),
            title: Text('Home'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.green,
            ),
            title: Text('Plasma Donors'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.bloodtype,
              color: Colors.green,
            ),
            title: Text('Plasma Requests'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.person_add,
              color: Colors.green,
            ),
            title: Text('Add Donor'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.add_moderator,
              color: Colors.green,
            ),
            title: Text('Add Plasma Requests'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.alarm,
              color: Colors.green,
            ),
            title: Text('Reminder'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.health_and_safety,
              color: Colors.green,
            ),
            title: Text('Blood Banks'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.call,
              color: Colors.green,
            ),
            title: Text('Contact us'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.share,
              color: Colors.green,
            ),
            title: Text('Share App'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.logout_sharp,
              color: Colors.green,
            ),
            title: Text('signout'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
