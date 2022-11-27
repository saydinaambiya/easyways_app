import 'package:easyplane_app/cubit/auth_cubit.dart';
import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/widgets/destination_card.dart';
import 'package:easyplane_app/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget headerHome() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
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
                              'Howdy,\n${state.user.name}',
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
                        decoration: const BoxDecoration(
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
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestinations() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
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

    Widget newDestinations() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          bottom: 100,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: navyText.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            const DestinationTile(
              imageUrlTile: 'assets/images/image_berantan.png',
              titleTile: 'Danau Beratan',
              cityTile: 'Singajara',
              ratingTile: 3.8,
            ),
            const DestinationTile(
              imageUrlTile: 'assets/images/image_opera.png',
              titleTile: 'Sydney Opera',
              cityTile: 'Australia',
              ratingTile: 4.7,
            ),
            const DestinationTile(
              imageUrlTile: 'assets/images/image_roma.png',
              titleTile: 'Roma',
              cityTile: 'Italy',
              ratingTile: 4.8,
            ),
            const DestinationTile(
              imageUrlTile: 'assets/images/image_teduh.png',
              titleTile: 'Payung Teduh',
              cityTile: 'Singapore',
              ratingTile: 4.5,
            ),
            const DestinationTile(
              imageUrlTile: 'assets/images/image_hill.png',
              titleTile: 'Hill Hey',
              cityTile: 'Monaco',
              ratingTile: 4.7,
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        headerHome(),
        popularDestinations(),
        newDestinations(),
      ],
    );
  }
}
