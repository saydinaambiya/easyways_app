import 'package:easyplane_app/shared/theme.dart';
import 'package:flutter/material.dart';

class DestinationTile extends StatelessWidget {
  final String imageUrlTile;
  final String titleTile;
  final String cityTile;
  final double ratingTile;

  const DestinationTile({
    Key? key,
    required this.imageUrlTile,
    required this.titleTile,
    required this.cityTile,
    this.ratingTile = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.fromLTRB(10, 10, 16, 10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imageUrlTile,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleTile,
                  style: navyText.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  cityTile,
                  style: greyText.copyWith(
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 18,
                width: 18,
                margin: const EdgeInsets.only(right: 3),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/icon_star.png'),
                  ),
                ),
              ),
              Text(
                ratingTile.toString(),
                style: navyText.copyWith(
                  fontWeight: medium,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
