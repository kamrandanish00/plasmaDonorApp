import 'package:flutter/material.dart';
import 'package:plasma_donor_app2/views/plasma_requests/plasma_requests_screen.dart';

import '../../app_styles.dart';
import '../../size_configs.dart';
import '../blood_donors_screen.dart';

class PlasmaRequestsBGScreen extends StatelessWidget {
  const PlasmaRequestsBGScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List bloodGroupList = [
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
      'O+',
      'O-',
    ];
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizedH!;
    double sizeV = SizeConfig.blockSizeV!;
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
            // Column(
            //   children: [

            //
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.of(context).pushNamed('PlasmaRequestsScreen');
            //       },
            //       child: BloodTypeContainer(
            //         txt: 'A+',
            //       ),
            //     ),
            //     //
            //     BloodTypeContainer(
            //       txt: 'A-',
            //     ),
            //   ],
            // ),
            // //
            // SizedBox(height: size.height * 0.03),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     BloodTypeContainer(
            //       txt: 'B+',
            //     ),
            //     //
            //     BloodTypeContainer(
            //       txt: 'B-',
            //     ),
            //   ],
            // ),
            // //
            // SizedBox(height: size.height * 0.03),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     BloodTypeContainer(
            //       txt: 'AB+',
            //     ),
            //     //
            //     BloodTypeContainer(
            //       txt: 'AB-',
            //     ),
            //   ],
            // ),
            // //
            // SizedBox(height: size.height * 0.03),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     BloodTypeContainer(
            //       txt: 'O+',
            //     ),
            //     //
            //     BloodTypeContainer(
            //       txt: 'O-',
            //     ),
            //   ],
            // ),
            //   ],
            // )

            //gridview.count
            Flexible(
              child: GridView.count(
                // childAspectRatio: 1.5,
                // physics: NeverScrollableScrollPhysics(),

                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                childAspectRatio: 1,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                shrinkWrap: true,
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(bloodGroupList.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed('PlasmaRequestsScreen');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => PlasmaRequestsScreen(
                              bloodGroup: bloodGroupList[index])));
                    },
                    child: BloodTypeContainer(txt: '${bloodGroupList[index]}'),
                  );
                }),
              ),
            ),
          ],
        ));
  }
}
