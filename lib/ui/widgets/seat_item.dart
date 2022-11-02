import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  //NOTE : 0. Available 1. Selected 2. Unavailable
  final int status;

  const SeatItem({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor() {
      switch (status) {
        case 0:
          return availableColor;
        case 1:
          return primaryColor;
        case 2:
          return unavailableColor;
        default:
          return unavailableColor;
      }
    }

    borderColor() {
      switch (status) {
        case 0:
          return primaryColor;
        case 1:
          return primaryColor;
        case 2:
          return unavailableColor;
        default:
          return unavailableColor;
      }
    }

    textChild() {
      switch (status) {
        case 0:
          return const SizedBox();
        case 1:
          return Center(
            child: Text(
              'YOU',
              style: whiteText.copyWith(
                fontWeight: semiBold,
              ),
            ),
          );
        case 2:
          return const SizedBox();
        default:
          return const SizedBox();
      }
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: backgroundColor(),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor(),
          width: 2,
        ),
      ),
      child: textChild(),
    );
  }
}
