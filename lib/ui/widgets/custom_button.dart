import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final double widthButton;
  final Function() onPressedButton;
  final EdgeInsets marginButton;

  const CustomButton({
    Key? key,
    required this.textButton,
    required this.onPressedButton,
    this.widthButton = double.infinity,
    this.marginButton = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginButton,
      width: widthButton,
      height: 55,
      child: TextButton(
        onPressed: onPressedButton,
        style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius))),
        child: Text(
          textButton,
          style: whiteText.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
