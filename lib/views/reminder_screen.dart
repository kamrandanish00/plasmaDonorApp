import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:plasma_donor_app2/views/custom_drawer.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/background_image.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/rounded_button.dart';

import '../app_styles.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  TextEditingController lastDonatedDateController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  var selectedDate;
  // var formatedDate;
  String? formattedDate;
  var nextDonation;
  var lastDonationDate;

  //
  //calculate next donation date
  calculateNextDonationDate(DateTime donatedDate) {
    var newDate =
        DateTime(donatedDate.year, donatedDate.month + 3, donatedDate.day);
    formattedDate = DateFormat('yyyy-MM-dd').format(newDate);

    print('This is the NEXT Donation Date======= $formattedDate');
    return formattedDate;
  }

  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(imgPath: 'assets/images/splash_img.png'),
        Scaffold(
          key: _scaffoldkey,
          backgroundColor: Colors.transparent,
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text(
              'Reminder',
              style: kBodyText.copyWith(color: kWhite),
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
                color: kWhite,
              ),
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('BloodCompatibilityScreen');
                    },
                    icon: Icon(
                      Icons.info,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _scaffoldkey.currentState!.openDrawer();
                    },
                    icon: Icon(Icons.menu),
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
                    // style: kTitle.copyWith(color: Colors.green),
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
                    // style: kTitle.copyWith(color: Colors.green),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    // child: TextField(
                    //   enabled: false,
                    //   decoration: InputDecoration(
                    //     hintText: 'Enter last donated date',
                    //   ),
                    // ),
                    //
                    child: DateTimeField(
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter your last donated date';
                        }
                        return null;
                      },
                      controller: lastDonatedDateController,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          selectedDate = value;
                          lastDonationDate =
                              DateFormat('yyyy-MM-dd').format(selectedDate);

                          nextDonation =
                              calculateNextDonationDate(selectedDate);
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: FaIcon(
                            FontAwesomeIcons.clock,
                            size: 28,
                            color: kWhite,
                          ),
                        ),
                        hintText: 'Enter last donated date',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                      format: DateFormat('yyyy-MM-dd'),
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          initialDate: currentValue ?? DateTime.now(),
                        );
                      },
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
                    // lastDonatedDateController.text ?? '29/12/2021',
                    lastDonationDate.toString(),
                    style: kBodyText.copyWith(color: Colors.green),
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
                      // '29/03/2022',
                      nextDonation.toString(),
                      // style: kBodyText1.copyWith(color: Colors.white),
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
