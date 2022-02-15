import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:plasma_donor_app2/model/add_donor.dart';
import 'package:plasma_donor_app2/views/custom_drawer.dart';
import 'package:plasma_donor_app2/widgets/alert_dialog.dart';
import 'package:plasma_donor_app2/widgets/phonenumber_textfield.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/widgets.dart';

import '../app_styles.dart';
import '../size_configs.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddDonorScreen extends StatefulWidget {
  const AddDonorScreen({Key? key}) : super(key: key);

  @override
  State<AddDonorScreen> createState() => _AddDonorScreenState();
}

class _AddDonorScreenState extends State<AddDonorScreen> {
  FirebaseAuth? _auth;
  User? _user;

  //controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();

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

  final _formKey = GlobalKey<FormState>();
  bool showLoading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //method for alertDialog
  _showDialog(BuildContext context) {
    VoidCallback continueCallBack = () => {
          Navigator.of(context).pop(),
          // code on continue comes here
        };
    BlurryDialog alert = BlurryDialog("Successfully added as donor",
        "Now people in need can contact you for donation.", continueCallBack);

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
    // isLoading = false;

    print('user ==== $_user');
    print('User phone number ---=== ${_user?.phoneNumber}');
  }

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig().init(context);
    // double sizeH = SizeConfig.blockSizedH!;
    // double sizeV = SizeConfig.blockSizeV!;
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        BackgroundImage(imgPath: 'assets/images/signin_bg_img.jpeg'),
        Scaffold(
          key: _scaffoldKey,
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
              'Become Donor',
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
                      _scaffoldKey.currentState!.openDrawer();
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
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Fill up the form below to become a \nDonor',
                                style: kBodyText,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Full Name',
                            style: kBodyText1.copyWith(
                              color: Colors.green,
                              fontSize: SizeConfig.blockSizedH! * 5,
                            ),
                          ),
                          TextInputField(
                            controller: nameController,
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
                          // TextInputField(
                          //   controller: mobileNumberController,
                          //   icon: Icons.mobile_friendly_rounded,
                          //   hint: 'Enter your phone number',
                          //   inputAction: TextInputAction.next,
                          //   inputType: TextInputType.phone,
                          // ),
                          //
                          phoneNumberTextField(
                            controller: mobileNumberController,
                            icon: Icons.mobile_friendly_rounded,
                            hint: 'Enter your phone number',
                            inputAction: TextInputAction.next,
                            inputType: TextInputType.phone,
                            // initialValue: _user?.phoneNumber,
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
                            'Hospital',
                            style: kBodyText1.copyWith(
                              color: Colors.green,
                              fontSize: SizeConfig.blockSizedH! * 5,
                            ),
                          ),
                          TextInputField(
                            controller: hospitalController,
                            icon: Icons.location_on_outlined,
                            hint: 'Enter nearer hospital name',
                            inputAction: TextInputAction.next,
                          ),
                          //
                          Text(
                            'Date of birth',
                            style: kBodyText1.copyWith(
                              color: Colors.green,
                              fontSize: SizeConfig.blockSizedH! * 5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: size.height * 0.08,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500]!.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: DateTimeField(
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter your birthdate';
                                    }
                                    return null;
                                  },
                                  controller: dateOfBirthController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    // border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.all(
                                    //         Radius.circular(15))),
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: FaIcon(
                                        FontAwesomeIcons.clock,
                                        size: 28,
                                        color: kWhite,
                                      ),
                                    ),
                                    hintText: 'Date of Birth',
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                  ),
                                  format: DateFormat('yyyy-MM-dd'),
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          // TextInputField(
                          //     icon: Icons.date_range_rounded,
                          //     hint: 'Enter your date of birth'),
                          //
                          Text(
                            'Blood group',
                            style: kBodyText1.copyWith(
                              color: Colors.green,
                              fontSize: SizeConfig.blockSizedH! * 5,
                            ),
                          ),
                          // TextInputField(
                          //   controller: bloodGroupController,
                          //   icon: Icons.bloodtype_outlined,
                          //   hint: 'Enter your blood group',
                          //   inputAction: TextInputAction.done,
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
                                  buttonName: 'Add',
                                  onPressed: () {
                                    //
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_formKey.currentState!.validate()) {
                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.
                                      DateTime currentPhoneDate =
                                          DateTime.now();
                                      Timestamp myTimeStamp =
                                          Timestamp.fromDate(
                                              currentPhoneDate); //To TimeStamp
                                      final newDonor = AddDonor(
                                        name: nameController.text,
                                        phoneNumber:
                                            mobileNumberController.text,
                                        city: cityController.text,
                                        hospital: hospitalController.text,
                                        dateOfBirth: DateTime.parse(
                                            dateOfBirthController.text),
                                        // bloodGroup: bloodGroupController.text,
                                        bloodGroup: selectedBloodType!,
                                        // postedDate: DateTime.now(),
                                        // postedDate: myTimeStamp,
                                      );

                                      createNewDonor(newDonor);
                                    }

                                    //
                                  },
                                ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Future createNewDonor(AddDonor newDonor) async {
    setState(() {
      showLoading = true;
    });

    try {
      final docDonor = FirebaseFirestore.instance.collection('Donors').doc();
      // newDonor.id = docDonor.id;

      final json = newDonor.toJson();
      await docDonor.set(json);
      setState(() {
        showLoading = false;
      });
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
