import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({Key? key,required this.icon, required this.onPressed}) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: Colors.white,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}