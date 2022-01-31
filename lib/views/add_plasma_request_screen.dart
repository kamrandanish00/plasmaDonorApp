import 'package:flutter/material.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/widgets.dart';

import '../app_styles.dart';
import '../size_configs.dart';

class AddPlasmaRequestScreen extends StatelessWidget {
  const AddPlasmaRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig().init(context);
    // double sizeH = SizeConfig.blockSizedH!;
    // double sizeV = SizeConfig.blockSizeV!;
    return Stack(
      children: [
        BackgroundImage(imgPath: 'assets/images/signin_bg_img.jpeg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              color: kWhite,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Plasma Request',
              style: kBodyText,
            ),
            centerTitle: true,
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.info,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                  ),
                ],
              )
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add plasma request',
                    style: kBodyText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(
                                '* Before posting plasma request we advise you',
                                style: kBodyText.copyWith(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'to contact plasma donors first.',
                                    style:
                                        kBodyText.copyWith(color: Colors.red),
                                    textAlign: TextAlign.center,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Find Donors'))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Full Name',
                        style: kBodyText1.copyWith(
                          color: Colors.green,
                          fontSize: SizeConfig.blockSizedH! * 5,
                        ),
                      ),
                      TextInputField(
                          icon: Icons.perm_identity_rounded,
                          hint: 'Enter your full name'),
                      //
                      Text(
                        'Mobile Number',
                        style: kBodyText1.copyWith(
                          color: Colors.green,
                          fontSize: SizeConfig.blockSizedH! * 5,
                        ),
                      ),
                      TextInputField(
                          icon: Icons.mobile_friendly_rounded,
                          hint: 'Enter your mobile Number'),
                      //
                      Text(
                        'City',
                        style: kBodyText1.copyWith(
                          color: Colors.green,
                          fontSize: SizeConfig.blockSizedH! * 5,
                        ),
                      ),
                      TextInputField(
                          icon: Icons.location_city, hint: 'Enter your city'),
                      //
                      Text(
                        'Hospital Name',
                        style: kBodyText1.copyWith(
                          color: Colors.green,
                          fontSize: SizeConfig.blockSizedH! * 5,
                        ),
                      ),
                      TextInputField(
                          icon: Icons.location_on_outlined,
                          hint: 'Enter hospital name'),
                      //
                      Text(
                        'Number of Blood Bags',
                        style: kBodyText1.copyWith(
                          color: Colors.green,
                          fontSize: SizeConfig.blockSizedH! * 5,
                        ),
                      ),
                      TextInputField(icon: Icons.date_range_rounded, hint: '2'),
                      //
                      Text(
                        'Leave Your Message Here',
                        style: kBodyText1.copyWith(
                          color: Colors.green,
                          fontSize: SizeConfig.blockSizedH! * 5,
                        ),
                      ),
                      TextInputField(
                          icon: Icons.bloodtype_outlined,
                          hint: 'Enter your message'),
                      Text(
                        '*All fields are required.',
                        style:
                            kBodyText.copyWith(color: Colors.red, fontSize: 14),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RoundedButton(
                          buttonName: 'Add Plasma Request', onPressed: () {}),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
