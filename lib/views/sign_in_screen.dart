import 'package:flutter/material.dart';
import 'package:plasma_donor_app2/app_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          imgPath: 'assets/images/signin_bg_img.jpeg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
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
                    hint: 'Email',
                    icon: FontAwesomeIcons.envelope,
                    inputAction: TextInputAction.next,
                    inputType: TextInputType.emailAddress,
                  ),
                  //password field
                  PasswordInput(
                    hint: 'Password',
                    icon: FontAwesomeIcons.lock,
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('ForgotPassword');
                    },
                    child: Text(
                      'Forgot password',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(height: 25),
                  RoundedButton(
                    buttonName: 'Login',
                    onPressed: () {},
                  ),
                  SizedBox(height: 25),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('CreateNewAccount');
                },
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: kWhite),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        )
      ],
    );
  }
}
