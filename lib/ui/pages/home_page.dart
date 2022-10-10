import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/widgets/destination_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget headerHome() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Howdy,\nAnne Lizie',
                        style: navyText.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/ava.png'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Whe to fly today?',
              style: greyText.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
          ],
        ),
      );
    }

    Widget popularDestinations() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              DestinationCard(
                imageUrlDestination: 'assets/images/image_ciliwung.png',
                nameDestination: 'Lake Ciliwung',
                cityDestination: 'Tanggerang',
                ratingDestination: 4.8,
              ),
              DestinationCard(
                imageUrlDestination: 'assets/images/image_whitehouse.png',
                nameDestination: 'White House',
                cityDestination: 'Spain',
                ratingDestination: 4.7,
              ),
              DestinationCard(
                imageUrlDestination: 'assets/images/image_heyo.png',
                nameDestination: 'Hill Heyo',
                cityDestination: 'Monaco',
                ratingDestination: 4.8,
              ),
              DestinationCard(
                imageUrlDestination: 'assets/images/image_menarra.png',
                nameDestination: 'Menarra',
                cityDestination: 'Japan',
                ratingDestination: 5.0,
              ),
              DestinationCard(
                imageUrlDestination: 'assets/images/image_teduh.png',
                nameDestination: 'Payung Teduh',
                cityDestination: 'Singapore',
                ratingDestination: 4.8,
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        headerHome(),
        popularDestinations(),
      ],
    );
  }
}
