import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class BookingDetailsItem extends StatelessWidget {
  const BookingDetailsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/icons/icon_check.png",
                ),
              ),
            ),
          ),
          Text(
            "Traveler",
            style: navyText,
          ),
          const Spacer(),
          Text(
            "2 person",
            style: navyText.copyWith(
              fontWeight: semiBold,
            ),
          )
        ],
      ),
    );
  }
}
