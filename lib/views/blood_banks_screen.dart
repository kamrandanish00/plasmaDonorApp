import 'package:flutter/material.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/background_image.dart';

import '../app_styles.dart';

class BloodBanksScreen extends StatelessWidget {
  const BloodBanksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(imgPath: 'assets/images/signin_bg_img.jpeg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Blood Banks',
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
          body: ListView.separated(
              itemBuilder: (context, index) {
                return BloodBankCard();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemCount: 20),
        )
      ],
    );
  }
}

class BloodBankCard extends StatelessWidget {
  const BloodBankCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Name:',
                      style:
                          kBodyText.copyWith(color: Colors.green, fontSize: 16),
                    ),
                    Text('Hamza Foundation'),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address:',
                      style:
                          kBodyText.copyWith(color: Colors.green, fontSize: 16),
                    ),
                    Text(
                        'Hamza Foundation, 33-F, khushal\nkhan khattak road, old bara\nroad, Peshawar, Pakistan.'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Contact:',
                      style:
                          kBodyText.copyWith(color: Colors.green, fontSize: 16),
                    ),
                    Text('03219006003'),
                  ],
                )
              ],
            ),
            //
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
