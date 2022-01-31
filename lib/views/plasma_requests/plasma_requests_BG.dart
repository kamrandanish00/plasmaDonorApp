import 'package:flutter/material.dart';

import '../../app_styles.dart';
import '../blood_donors_screen.dart';

class PlasmaRequestsBGScreen extends StatelessWidget {
  const PlasmaRequestsBGScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'People in need',
            style: kBodyText.copyWith(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select Required Blood type',
                  style: kBodyText.copyWith(color: Colors.black),
                ),
              ],
            ),
            //
            SizedBox(height: size.height * 0.05),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('PlasmaRequestsScreen');
                      },
                      child: BloodTypeContainer(
                        txt: 'A+',
                      ),
                    ),
                    //
                    BloodTypeContainer(
                      txt: 'A-',
                    ),
                  ],
                ),
                //
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BloodTypeContainer(
                      txt: 'B+',
                    ),
                    //
                    BloodTypeContainer(
                      txt: 'B-',
                    ),
                  ],
                ),
                //
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BloodTypeContainer(
                      txt: 'AB+',
                    ),
                    //
                    BloodTypeContainer(
                      txt: 'AB-',
                    ),
                  ],
                ),
                //
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BloodTypeContainer(
                      txt: 'O+',
                    ),
                    //
                    BloodTypeContainer(
                      txt: 'O-',
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
