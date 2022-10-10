import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class DestinationCard extends StatelessWidget {
  final String imageUrlDestination;
  final String nameDestination;
  final String cityDestination;
  final double ratingDestination;

  const DestinationCard({
    Key? key,
    required this.imageUrlDestination,
    required this.nameDestination,
    required this.cityDestination,
    this.ratingDestination = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 323,
      margin: EdgeInsets.only(left: defaultMargin),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 180,
            height: 220,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(imageUrlDestination),
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 55,
                height: 30,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                  ),
                ),
                child: Row(
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
                      ratingDestination.toString(),
                      style: navyText.copyWith(
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameDestination,
                  style: navyText.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  cityDestination,
                  style: greyText.copyWith(
                    fontWeight: light,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
