import 'package:easyplane_app/models/destination_model.dart';
import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/pages/choose_seat_page.dart';
import 'package:easyplane_app/ui/widgets/custom_button.dart';
import 'package:easyplane_app/ui/widgets/interest_item.dart';
import 'package:easyplane_app/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;

  const DetailPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destination.imageUrl),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              whiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95)
            ])),
      );
    }

    Widget detailContent() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            // NOTE : EMBLEM LOGO
            Container(
              width: 108,
              height: 24,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/icon_emblem.png',
                  ),
                ),
              ),
            ),
            // NOTE : TITLE
            Container(
              margin: const EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: whiteText.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          destination.city,
                          style: whiteText.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                          overflow: TextOverflow.ellipsis,
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
                        destination.rating.toString(),
                        style: whiteText.copyWith(
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // NOTE : DESC
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE : ABOUT
                  Text(
                    'About',
                    style: navyText.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: navyText.copyWith(
                      height: 2.6,
                    ),
                  ),
                  // NOTE : PHOTOS
                  const SizedBox(height: 20),
                  Text(
                    'Photos',
                    style: navyText.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      PhotoItem(imageUrl: 'assets/images/photos1_ciliwung.png'),
                      PhotoItem(imageUrl: 'assets/images/photos2_ciliwung.png'),
                      PhotoItem(imageUrl: 'assets/images/photos3_ciliwung.png'),
                    ],
                  ),
                  // NOTE : INTEREST
                  const SizedBox(height: 20),
                  Text(
                    'Interest',
                    style: navyText.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      InterestItem(
                        textInterest: 'Kids Park',
                      ),
                      InterestItem(
                        textInterest: 'Honor Bridge',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InterestItem(
                        textInterest: 'City Museuem',
                      ),
                      InterestItem(
                        textInterest: 'Central Mall',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // NOTE : PRICE AND BUTTON
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  // NOTE : PRICE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'IDR ',
                            decimalDigits: 0,
                          ).format(destination.price),
                          style: navyText.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'per orang',
                          style: greyText.copyWith(
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                  ),
                  // NOTE : BOOK BUTTON
                  CustomButton(
                    textButton: 'Book Now',
                    onPressedButton: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseSeatPage(destination),
                        ),
                      );
                    },
                    widthButton: 170,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            detailContent(),
          ],
        ),
      ),
    );
  }
}
