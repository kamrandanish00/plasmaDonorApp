import 'package:flutter/material.dart';
import 'package:plasma_donor_app2/app_styles.dart';

class PlasmaDonorsScreen extends StatelessWidget {
  const PlasmaDonorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Find Plasma',
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
                    BloodTypeContainer(
                      txt: 'A+',
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

class BloodTypeContainer extends StatelessWidget {
  const BloodTypeContainer({
    Key? key,
    required this.txt,
  }) : super(key: key);
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Text(
          txt,
          style: kTitle.copyWith(color: Colors.green),
        ),
      ),
    );
  }
}
