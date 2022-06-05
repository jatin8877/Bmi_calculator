import 'package:bmi_calculator/bmi_widget/bottom_button_widget.dart';
import 'package:bmi_calculator/bmi_widget/card_control.dart';
import 'package:bmi_calculator/bmi_widget/icon_widget.dart';
import 'package:bmi_calculator/bmi_widget/rounded_icon_widget.dart';
import 'package:bmi_calculator/screens/bmi_result.dart';
import 'package:bmi_calculator/services/calculate_bmi_service.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum GenderType { male, female }

class BMIInputScreen extends StatefulWidget {
  const BMIInputScreen({Key? key}) : super(key: key);

  @override
  State<BMIInputScreen> createState() => _BMIInputScreenState();
}

class _BMIInputScreenState extends State<BMIInputScreen> {
  GenderType selectedGender = GenderType.male;
  double height = 180;
  int age = 24;
  double weight = 66;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        leading: const Icon(Icons.health_and_safety),
        backgroundColor: kBackgroundColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                  child: CardControl(
                    bgColor: selectedGender == GenderType.male
                        ? kCardActiveBackground
                        : kCardInActiveBackground,
                    cardChid: const IconCOntrol(
                        iconData: FontAwesomeIcons.person, iconText: 'MALE'),
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CardControl(
                      bgColor: selectedGender == GenderType.female
                          ? kCardActiveBackground
                          : kCardInActiveBackground,
                      cardChid: const IconCOntrol(
                          iconData: FontAwesomeIcons.person,
                          iconText: 'FEMALE'),
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      }),
                ),
              ]),
            ),
            Expanded(
              child: CardControl(
                bgColor: kCardActiveBackground,
                cardChid: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Height', style: klabelSubheaderTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toStringAsFixed(1),
                          style: klabelNumberTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kSliderActiveColor,
                          inactiveTrackColor: kSliderInactiveColor,
                          trackShape: const RectangularSliderTrackShape(),
                          trackHeight: 4.0,
                          thumbColor: kSliderThumbColor,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 12.0),
                          overlayColor: kSliderThumbColor.withAlpha(60),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 28.0)),
                      child: Slider(
                          value: height,
                          min: 100.0,
                          max: 250.0,
                          onChanged: (newValue) {
                            setState(() {
                              height = newValue;
                            });
                          }),
                    )
                  ],
                ),
                onPress: () {},
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardControl(
                        bgColor: kCardActiveBackground,
                        cardChid: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('WEIGHT',
                                style: klabelSubheaderTextStyle),
                            Text('$weight', style: klabelNumberTextStyle),
                            Row(
                              children: [
                                Expanded(
                                  child: RoundedButtonIcon(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RoundedButtonIcon(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      }),
                                )
                              ],
                            ),
                          ],
                        ),
                        onPress: () {}),
                  ),
                  Expanded(
                    child: CardControl(
                        bgColor: kCardActiveBackground,
                        cardChid: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('AGE', style: klabelSubheaderTextStyle),
                            Text('$age', style: klabelNumberTextStyle),
                            Row(
                              children: [
                                Expanded(
                                  child: RoundedButtonIcon(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          if (age > 0) age--;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RoundedButtonIcon(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      }),
                                )
                              ],
                            ),
                          ],
                        ),
                        onPress: () {}),
                  ),
                ],
              ),
            ),
            BottomButton(
                buttonText: 'CALCULATE BMI',
                onTap: () {
                  var bmi = CalculateBMI(height, weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResult(
                        bmi: bmi.calculate(),
                        bmiResult: bmi.getResult(),
                        bmiNarration: bmi.getNarration(),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
