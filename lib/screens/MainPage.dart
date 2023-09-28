import 'package:flutter/material.dart';
import '../CircularButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key,});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double rice = 0;
  double water = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'YOU NEED',
                        style: kResultLabelStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${water.toStringAsFixed(2)} DL OF WATER",
                        style: kResultTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'DL OF RICE:',
                    style: kRiceLabelStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputWidget(
                    onPressedDec: (){
                      setState(() {
                        rice -=0.5;
                        water = calculateRatio(rice);
                      });
                    },
                    onPressedInc: (){
                      setState(() {
                        rice +=0.5;
                        water = calculateRatio(rice);
                      });
                    },
                    displayInfo: rice.toString(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double calculateRatio(rice){
  return rice * 1.5;
}

class InputWidget extends StatelessWidget {
  const InputWidget({super.key, required this.onPressedDec,required this.onPressedInc, required this.displayInfo});

  final VoidCallback onPressedDec;
  final VoidCallback onPressedInc;
  final String displayInfo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularButton(
          onPressed: onPressedDec,
          icon: FontAwesomeIcons.minus,
        ),
        const SizedBox(
          width: kInputButtonSpacing,
        ),
        Text(
          displayInfo,
          style: kInputLabelStyle,
        ),
        const SizedBox(
          width: kInputButtonSpacing,
        ),
        CircularButton(
          onPressed: onPressedInc,
          icon: FontAwesomeIcons.plus,
        ),
      ],
    );
  }
}
