import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:plasma_donor_app2/model/add_plasma_request.dart';
import 'package:plasma_donor_app2/widgets/alert_dialog.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/widgets.dart';

import '../app_styles.dart';
import '../size_configs.dart';
import 'custom_drawer.dart';

class AddPlasmaRequestScreen extends StatefulWidget {
  const AddPlasmaRequestScreen({Key? key}) : super(key: key);

  @override
  State<AddPlasmaRequestScreen> createState() => _AddPlasmaRequestScreenState();
}

class _AddPlasmaRequestScreenState extends State<AddPlasmaRequestScreen> {
  FirebaseAuth? _auth;
  User? _user;
  //controllers
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController numberOfBloodBagsController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showLoading = false;
  //bloodtype
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
  String? selectedBloodType;

  //method for alertDialog
  _showDialog(BuildContext context) {
    VoidCallback continueCallBack = () => {
          Navigator.of(context).pop(),
          // code on continue comes here
        };
    BlurryDialog alert = BlurryDialog("Plasma Request",
        "Your plasma request has been added.", continueCallBack);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _auth = FirebaseAuth.instance;
    _user = _auth?.currentUser;
    mobileNumberController = TextEditingController(text: _user?.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig().init(context);
    // double sizeH = SizeConfig.blockSizedH!;
    // double sizeV = SizeConfig.blockSizeV!;
    final _scaffoldkey = GlobalKey<ScaffoldState>();
    return Stack(
      children: [
        BackgroundImage(imgPath: 'assets/images/signin_bg_img.jpeg'),
        Scaffold(
          key: _scaffoldkey,
          drawer: CustomDrawer(),
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //
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
                                            style: kBodyText.copyWith(
                                                color: Colors.red),
                                            textAlign: TextAlign.center,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'to contact plasma donors first.',
                                                style: kBodyText.copyWith(
                                                    color: Colors.red),
                                                textAlign: TextAlign.center,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushReplacementNamed(
                                                            'PlasmaDonors');
                                                  },
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
                          //
                          Text(
                            'Full Name',
                            style: kBodyText1.copyWith(
                              color: Colors.green,
                              fontSize: SizeConfig.blockSizedH! * 5,
                            ),
                          ),
                          TextInputField(
                            controller: fullNameController,
                            icon: Icons.perm_identity_rounded,
                            hint: 'Enter your full name',
                            inputAction: TextInputAction.next,
                          ),
                          //
                          Text(
                            'Mobile Number',
                            style: kBodyText1.copyWith(
                              color: Colors.green,
                              fontSize: SizeConfig.blockSizedH! * 5,
                            ),
                          ),
                          TextInputField(
                            controller: mobileNumberController,
                            icon: Icons.mobile_friendly_rounded,
                            hint: 'Enter your mobile Number',
                            inputAction: TextInputAction.next,
                          ),
                          //
                          Text(
                            'City',
                            style: kBodyText1.copyWith(
                              color: Colors.green,
                              fontSize: SizeConfig.blockSizedH! * 5,
                            ),
                          ),
                          TextInputField(
                            controller: cityController,
                            icon: Icons.location_city,
                            hint: 'Enter your city',
                            inputAction: TextInputAction.next,
                          ),
                          //
                          Text(
                            'Hospital Name',
                            style: kBodyText1.copyWith(
                              color: Colors.green,
                              fontSize: SizeConfig.blockSizedH! * 5,
                            ),
                          ),
                          TextInputField(
                            controller: hospitalNameController,
                            icon: Icons.location_on_outlined,
                            hint: 'Enter hospital name',
                            inputAction: TextInputAction.next,
                          ),
                          //
                          Text(
                            'Number of Blood Bags',
                            style: kBodyText1.copyWith(
                              color: Colors.green,
                              fontSize: SizeConfig.blockSizedH! * 5,
                            ),
                          ),
                          TextInputField(
                            controller: numberOfBloodBagsController,
                            icon: Icons.date_range_rounded,
                            hint: '2',
                            inputAction: TextInputAction.next,
                          ),
                          //
                          Text(
                            'Blood Group Required',
                            style: kBodyText1.copyWith(
                              color: Colors.green,
                              fontSize: SizeConfig.blockSizedH! * 5,
                            ),
                          ),
                          // TextInputField(
                          //   controller: bloodGroupController,
                          //   icon: Icons.bloodtype_outlined,
                          //   hint: 'Enter required blood group',
                          //   inputAction: TextInputAction.next,
                          // ),
                          //dropdown for bloodtype
                          DropdownButton(
                            dropdownColor: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                            hint: Text(
                              'Select your blood type',
                              style: kBodyText.copyWith(color: Colors.grey),
                            ),
                            style: kBodyText.copyWith(color: Colors.green),
                            value: selectedBloodType,
                            isExpanded: true,
                            items: bloodGroupList.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style:
                                      kBodyText.copyWith(color: Colors.white),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedBloodType = value.toString();
                              });
                            },
                          ),
                          //
                          Text(
                            'Leave Your Message Here',
                            style: kBodyText1.copyWith(
                              color: Colors.green,
                              fontSize: SizeConfig.blockSizedH! * 5,
                            ),
                          ),
                          TextInputField(
                            controller: messageController,
                            icon: Icons.message,
                            hint: 'Enter your message',
                            inputAction: TextInputAction.done,
                          ),
                          Text(
                            '*All fields are required.',
                            style: kBodyText.copyWith(
                                color: Colors.red, fontSize: 14),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          showLoading
                              ? Center(
                                  child: SpinKitWave(
                                    size: 30,
                                    color: Colors.green,
                                  ),
                                )
                              : RoundedButton(
                                  buttonName:
                                      //  showLoading
                                      //     ? 'Loading...'
                                      //     :
                                      'Add Plasma Request',
                                  onPressed: () {
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_formKey.currentState!.validate()) {
                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.
                                      // DateTime currentPhoneDate =
                                      //     DateTime.now();
                                      // Timestamp myTimeStamp =
                                      //     Timestamp.fromDate(currentPhoneDate);
                                      // print('Current date $currentPhoneDate');
                                      // print(
                                      //     'Current date to timastamp $myTimeStamp');

                                      //new datetime to timestamp
                                      String timestamp;

                                      DateTime now = DateTime.now();
                                      String formatDate =
                                          DateFormat('yyyy-MM-dd ')
                                              .add_jm()
                                              .format(now);
                                      //new format
                                      // String formatDate =
                                      //     DateFormat.yMd().add_jm().format(now);
                                      timestamp = formatDate;
                                      //
                                      final newPlasmaRequest = AddPlasmaRequest(
                                        fullName: fullNameController.text,
                                        phoneNumber:
                                            mobileNumberController.text,
                                        city: cityController.text,
                                        hospitalName:
                                            hospitalNameController.text,
                                        message: messageController.text,
                                        // bloodGroup: bloodGroupController.text,
                                        bloodGroup: selectedBloodType!,
                                        numberOfBloodBags:
                                            numberOfBloodBagsController.text,
                                        postedDate: timestamp,
                                      );

                                      createNewPlasmaRequest(newPlasmaRequest);
                                    }
                                  },
                                ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //
              ],
            ),
          ),
        )
      ],
    );
  }

  Future createNewPlasmaRequest(AddPlasmaRequest newDonor) async {
    setState(() {
      showLoading = true;
    });
    try {
      final docPlasmaRequest =
          FirebaseFirestore.instance.collection('plasmaRequests').doc();
      // newDonor.id = docDonor.id;

      final json = newDonor.toJson();
      await docPlasmaRequest.set(json);
      setState(() {
        showLoading = false;
      });

      //

      // Navigator.of(context).pop();
      _showDialog(context);
    } on FirebaseException catch (e) {
      setState(() {
        showLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    } on SocketException catch (e) {
      setState(() {
        showLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
