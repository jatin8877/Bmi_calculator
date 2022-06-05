import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/constants.dart';

class IconCOntrol extends StatelessWidget {
  final IconData iconData;
  final String iconText;
  const IconCOntrol({Key? key, required this.iconData, required this.iconText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
          color: kIconBackgroundColor,
        ),
        const SizedBox(height: 15.0),
        Text(
          iconText,
          style: klabelTextStyle,
        )
      ],
    );
  }
}
