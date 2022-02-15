import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plasma_donor_app2/app_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/widgets.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final mobileNumberController = TextEditingController();
  final otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool showLoading = false;
  void singInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final AuthCredential =
          await auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });

      if (AuthCredential.user != null) {
        Navigator.of(context).pushReplacementNamed('HomeScreen');
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          imgPath: 'assets/images/signin_bg_img.jpeg',
        ),
        Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          body: showLoading
              ? Center(
                  child: SpinKitWave(
                    size: 30,
                    color: Colors.green,
                  ),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget()
                  : getOTPFormState(),
        )
      ],
    );
  }

  Column getMobileFormWidget() {
    return Column(
      children: [
        Flexible(
          child: Center(
            child: Text(
              'PlasmaDonor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        //
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextInputField(
              hint: 'Enter Mobile Number',
              icon: FontAwesomeIcons.mobileAlt,
              inputAction: TextInputAction.next,
              inputType: TextInputType.phone,
              controller: mobileNumberController,
            ),
            //password field
            // PasswordInput(
            //   hint: 'Password',
            //   icon: FontAwesomeIcons.lock,
            //   inputType: TextInputType.name,
            //   inputAction: TextInputAction.done,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.of(context).pushNamed('ForgotPassword');
            //   },
            //   child: Text(
            //     'Forgot password',
            //     style: kBodyText,
            //   ),
            // ),
            SizedBox(height: 25),
            RoundedButton(
              buttonName: 'Send OTP',
              onPressed: () async {
                setState(() {
                  showLoading = true;
                });
                await auth.verifyPhoneNumber(
                  phoneNumber: mobileNumberController.text,
                  verificationCompleted: (PhoneAuthCredential) async {
                    setState(() {
                      showLoading = false;
                    });
                  },
                  verificationFailed: (PhoneVerificationFailed) async {
                    setState(() {
                      showLoading = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(PhoneVerificationFailed.message!)));
                  },
                  codeSent: (verifcationId, resendingToken) async {
                    setState(() {
                      showLoading = false;
                      currentState =
                          MobileVerificationState.SHOW_OTP_FORM_STATE;
                      verificationId = verifcationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verficationId) async {},
                );
              },
            ),
            SizedBox(height: 25),
          ],
        ),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.of(context).pushNamed('CreateNewAccount');
        //   },
        //   child: Container(
        //     child: Text(
        //       'Create New Account',
        //       style: kBodyText,
        //     ),
        //     decoration: BoxDecoration(
        //       border: Border(
        //         bottom: BorderSide(width: 1, color: kWhite),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(height: 60),
      ],
    );
  }

  getOTPFormState() {
    return Column(
      children: [
        Flexible(
          child: Center(
            child: Text(
              'PlasmaDonor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        //
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextInputField(
              hint: 'Enter OTP',
              icon: FontAwesomeIcons.mobileAlt,
              inputAction: TextInputAction.done,
              inputType: TextInputType.number,
              controller: otpController,
            ),
            //password field
            // PasswordInput(
            //   hint: 'Password',
            //   icon: FontAwesomeIcons.lock,
            //   inputType: TextInputType.name,
            //   inputAction: TextInputAction.done,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.of(context).pushNamed('ForgotPassword');
            //   },
            //   child: Text(
            //     'Forgot password',
            //     style: kBodyText,
            //   ),
            // ),
            SizedBox(height: 25),
            RoundedButton(
              buttonName: 'Verify',
              onPressed: () async {
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationId ?? 'id',
                        smsCode: otpController.text);

                singInWithPhoneAuthCredential(phoneAuthCredential);
              },
            ),
            SizedBox(height: 25),
          ],
        ),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.of(context).pushNamed('CreateNewAccount');
        //   },
        //   child: Container(
        //     child: Text(
        //       'Create New Account',
        //       style: kBodyText,
        //     ),
        //     decoration: BoxDecoration(
        //       border: Border(
        //         bottom: BorderSide(width: 1, color: kWhite),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(height: 60),
      ],
    );
  }
}
