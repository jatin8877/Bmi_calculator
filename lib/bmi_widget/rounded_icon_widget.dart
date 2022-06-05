import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedButtonIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const RoundedButtonIcon(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(width: 50.0, height: 50.0),
      shape: const CircleBorder(),
      fillColor: kRoundedIconButtonColor,
      child: Icon(icon),
    );
  }
}
