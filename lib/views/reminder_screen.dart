import 'package:flutter/material.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/background_image.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/rounded_button.dart';

import '../app_styles.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(imgPath: 'assets/images/splash_img.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Reminder',
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
              ),
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.info,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Set Reminder',
                    style: kTitle.copyWith(color: Colors.green),
                  ),
                  Text(
                    'By setting reminder, your contact information would not show in\ndonor list for next 3 months.',
                    style: kBodyText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              //
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Enter Your Last Donated Date',
                    style: kTitle.copyWith(color: Colors.green),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: 'Enter last donated date',
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  RoundedButton(buttonName: 'Submit', onPressed: () {}),
                  SizedBox(height: 30),
                  Text(
                    'Last Donation Date',
                    style: kBodyText,
                  ),
                  Text(
                    '29/12/2021',
                    style: kTitle.copyWith(color: Colors.green),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Now You Can Donate On',
                    style: kBodyText,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Text(
                      '29/03/2022',
                      style: kTitle.copyWith(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
