import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:plasma_donor_app2/app_styles.dart';
import 'package:plasma_donor_app2/main.dart';
import 'package:plasma_donor_app2/model/onboard_data.dart';
import 'package:plasma_donor_app2/size_configs.dart';
import 'package:plasma_donor_app2/views/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages.dart';
import '../widgets/widgets.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  //this function will set seenOnboard to true
  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
    //this will set seenOnboard to true when running onboard page for first time.
  }

  @override
  void initState() {
    super.initState();
    setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizedH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingContents.length,
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: sizeV * 5,
                  ),
                  Text(
                    onboardingContents[index].title,
                    style: kTitle,
                    textAlign: TextAlign.center,
                  ),
                  // SizedBox(height: sizeV * 5),
                  Container(
                    height: sizeV * 60,
                    child: Lottie.asset(onboardingContents[index].image),
                  ),
                  SizedBox(height: sizeV * 5),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'We will ',
                          // style: TextStyle(
                          //   fontSize: 20,
                          //   color: Colors.blue,
                          // ),
                        ),
                        TextSpan(text: 'help you '),
                        TextSpan(text: 'save yourself or '),
                        TextSpan(text: ' your relatives cope Covid-19')
                      ],
                      style: kBodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                currentPage == onboardingContents.length - 1
                    ? GetStartedBtn(
                        buttonName: 'Get Started',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => SignInScreen()));
                        },
                        bgColor: kPrimaryColor,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OnboardingNavBtn(
                            name: 'Skip',
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => SignUpPage()));
                            },
                          ),
                          Row(
                            children: List.generate(onboardingContents.length,
                                (index) => dotIndicator(index)),
                          ),
                          OnboardingNavBtn(
                            name: 'Next',
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
