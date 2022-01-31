import 'package:flutter/material.dart';
import 'package:plasma_donor_app2/app_styles.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/widgets.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(imgPath: 'assets/images/forgot_password_bk_img.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Forgot Password',
              style: kBodyText,
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.1),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        'Enter your email, we will send insturctions to reset your password.',
                        style: kBodyText,
                      ),
                    ),
                    SizedBox(height: size.height * 0.1),
                    TextInputField(
                      icon: Icons.email,
                      hint: 'Password',
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: size.height * 0.01),
                    RoundedButton(
                      buttonName: 'Send',
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
