import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const BottomButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(buttonText, style: klabelLargeTextStyle),
        ),
        color: kbottomContainerColor,
        height: kbottomContainerHeight,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10.0),
      ),
      onTap: onTap,
    );
  }
}
