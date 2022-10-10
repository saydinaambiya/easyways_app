import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bonus card
    Widget bonusCard() {
      return Container(
        width: 300,
        height: 211,
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/card_image.png',
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 20),
            ),
          ],
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
                        'Name',
                        style: whiteText.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        'Anne Lizie',
                        style: whiteText.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(
                    right: 6,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icons/icon_plane.png',
                      ),
                    ),
                  ),
                ),
                Text(
                  'Pay',
                  style: whiteText.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
            const SizedBox(height: 41),
            Text(
              'Balance',
              style: whiteText.copyWith(
                fontWeight: light,
              ),
            ),
            Text(
              'IDR 28.000.000',
              style: whiteText.copyWith(
                fontSize: 26,
                fontWeight: medium,
              ),
            )
          ],
        ),
      );
    }

    //title bonus
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 80),
        child: Text(
          'Big Bonus 🎉',
          style: navyText.copyWith(
            fontSize: 32,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    //subtitle bonus
    Widget subtitle() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          'We give you early credit so that\nyou can buy a flight ticket EASY',
          style: greyText.copyWith(
            fontSize: 16,
            fontWeight: light,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    //start button
    Widget startbutton() {
      return CustomButton(
        widthButton: 220,
        marginButton: const EdgeInsets.only(top: 50),
        textButton: 'Start Fly Now',
        onPressedButton: () {
          Navigator.pushNamed(context, '/main');
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            title(),
            subtitle(),
            startbutton(),
          ],
        ),
      ),
    );
  }
}
