import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plasma_donor_app2/app_styles.dart';

class phoneNumberTextField extends StatelessWidget {
  const phoneNumberTextField({
    Key? key,
    this.icon,
    required this.hint,
    this.inputAction,
    this.inputType,
    this.controller,
    this.initialValue,
  }) : super(key: key);

  final IconData? icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(
            initialValue: initialValue,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill this field';
              }
              return null;
            },
            controller: controller,

            decoration: InputDecoration(
              errorStyle: TextStyle(
                fontSize: 9,
                height: 0.1,
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(15)),
              // ),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: FaIcon(
                  icon,
                  size: 28,
                  color: kWhite,
                ),
              ),
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            style: kBodyText,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}
