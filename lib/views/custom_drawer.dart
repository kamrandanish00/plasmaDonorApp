import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plasma_donor_app2/views/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Drawer(
      // color: Colors.green,
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => ProfileScreen()));
            },
            child: ListTile(
              title: Text('Profile'),
              subtitle: Text(_auth.currentUser!.phoneNumber.toString()),
              leading: Icon(
                Icons.person,
                size: 40,
                color: Colors.green,
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('HomeScreen');
            },
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: Text('Home'),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('PlasmaDonors');
            },
            child: ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.green,
              ),
              title: Text('Plasma Donors'),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('PlasmaRequestScreen');
            },
            child: ListTile(
              leading: Icon(
                Icons.bloodtype,
                color: Colors.green,
              ),
              title: Text('Plasma Requests'),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('AddDonorScreen');
            },
            child: ListTile(
              leading: Icon(
                Icons.person_add,
                color: Colors.green,
              ),
              title: Text('Add Donor'),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('PlasmaRequestScreen');
            },
            child: ListTile(
              leading: Icon(
                Icons.add_moderator,
                color: Colors.green,
              ),
              title: Text('Add Plasma Requests'),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('ReminderScreen');
            },
            child: ListTile(
              leading: Icon(
                Icons.alarm,
                color: Colors.green,
              ),
              title: Text('Reminder'),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('BloodBanksScreen');
            },
            child: ListTile(
              leading: Icon(
                Icons.health_and_safety,
                color: Colors.green,
              ),
              title: Text('Blood Banks'),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('ContactUsScreen');
            },
            child: ListTile(
              leading: Icon(
                Icons.call,
                color: Colors.green,
              ),
              title: Text('Contact us'),
            ),
          ),
          Divider(),
          GestureDetector(
            // onTap: () {
            //   Navigator.of(context).pushReplacementNamed('HomeScreen');
            // },
            child: ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.green,
              ),
              title: Text('Share App'),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () async {
              await _auth.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
            child: ListTile(
              leading: Icon(
                Icons.logout_sharp,
                color: Colors.green,
              ),
              title: Text('signout'),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
