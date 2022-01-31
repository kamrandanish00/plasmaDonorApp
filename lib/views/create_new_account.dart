import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plasma_donor_app2/app_styles.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/background_image.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/password_input.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/rounded_button.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/text_field_input.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(imgPath: 'assets/images/signin_bg_img.jpeg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.width * 0.1),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 3,
                            sigmaY: 3,
                          ),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]?.withOpacity(0.4),
                            child: FaIcon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.arrowUp,
                            color: kWhite,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.width * 0.1),
                Column(
                  children: [
                    TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'User',
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.name,
                    ),
                    TextInputField(
                        icon: FontAwesomeIcons.envelope,
                        hint: 'Email',
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.emailAddress),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Confirm Password',
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(height: size.width * 0.05),
                    RoundedButton(
                      buttonName: 'Register',
                      onPressed: () {
                        Navigator.of(context).pushNamed('HomeScreen');
                      },
                    ),
                    SizedBox(height: size.width * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have account?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/');
                          },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
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
