import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:plasma_donor_app2/app_styles.dart';

import 'plasma_donors/plasma_donors_screen.dart';

class PlasmaDonorsScreenBG extends StatelessWidget {
  const PlasmaDonorsScreenBG({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
              Expanded(
                child: GridView.count(
                  // physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 1,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(bloodGroupList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => PlasmaDonorsScreen(
                              bloodGroup: bloodGroupList[index],
                            ),
                          ),
                        );
                      },
                      child:
                          BloodTypeContainer(txt: '${bloodGroupList[index]}'),
                    );
                  }),
                ),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
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
    // return Card(
    //   color: Colors.green,
    //   elevation: 2,
    //   // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //   shape: CircleBorder(),
    //   child: Container(
    //     alignment: Alignment.center,
    //     // height: 100,
    //     // width: 100,
    //     decoration: BoxDecoration(
    //       color: Colors.red,
    //       shape: BoxShape.circle,
    //     ),
    //     child: Text(
    //       txt,
    //       style: kBodyText.copyWith(color: Colors.white),
    //     ),
    //   ),
    // );

    //clay Container
    return ClayContainer(
      color: Color(0xFFF2F2F2),
      height: 150,
      width: 150,
      borderRadius: 75,
      depth: 40,
      spread: 40,
      child: Center(
        child: Text(
          txt,
          style: kBodyText.copyWith(color: Colors.green),
        ),
      ),
    );
  }
}
