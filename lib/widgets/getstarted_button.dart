import 'package:flutter/material.dart';

import '../app_styles.dart';
import '../size_configs.dart';

class GetStartedBtn extends StatelessWidget {
  const GetStartedBtn({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: SizeConfig.blockSizeV! * 6.5,
        width: SizeConfig.blockSizedH! * 100,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: kBodyText1,
          ),
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
          ),
        ),
      ),
    );
  }
}