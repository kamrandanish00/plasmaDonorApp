import 'package:flutter/material.dart';

import '../app_styles.dart';

class HomeScreenItem extends StatelessWidget {
  const HomeScreenItem({
    Key? key,
    required this.txt,
    required this.icon,
  }) : super(key: key);

  final String txt;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.13,
          width: size.height * 0.13,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Card(
            color: Colors.green,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              child: Icon(
                icon,
                color: Colors.white,
                size: size.height * 0.05,
              ),
            ),
          ),
        ),
        FittedBox(
          child: Text(
            txt,
            style: kBodyText.copyWith(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
