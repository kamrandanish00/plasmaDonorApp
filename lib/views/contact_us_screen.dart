import 'package:flutter/material.dart';
import 'package:plasma_donor_app2/services/indirectPhoneCall.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_styles.dart';
import 'email_screen.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(imgPath: 'assets/images/signin_bg_img.jpeg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Contact us',
              style: kBodyText.copyWith(color: Colors.white),
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
                color: Colors.white,
              ),
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    'If you have any query? You can contact us',
                    style: kBodyText,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Call: ',
                      style: kBodyText,
                    ),
                    IconButton(
                      onPressed: () async {
                        var phoneNumber = '+923085401482';
                        // await launch(
                        //   'tell://$phoneNumber',
                        // );
                        // await FlutterPhoneDirectCaller.callNumber(phoneNumber);
                        // await launch(phoneNumber);
                        // _launch(phoneNumber);

                        //
                        Future<void>? _launched =
                            IndirectPhoneCall().openUrl('tel://${phoneNumber}');
                      },
                      icon: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Email: ',
                      style: kBodyText,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => EmailScreen()));
                      },
                      icon: Icon(
                        Icons.mail_rounded,
                        color: Colors.green,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

void _launch(phoneNumber) async {
  if (!await launch(phoneNumber)) throw 'Could not launch $phoneNumber';
}
