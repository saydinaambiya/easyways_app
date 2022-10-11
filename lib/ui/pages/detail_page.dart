import 'package:easyplane_app/shared/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/image_ciliwung.png'),
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
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
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
                          'Lake Ciliwung',
                          style: whiteText.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Tanggerang',
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
                        '4.5',
                        style: whiteText.copyWith(
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          backgroundImage(),
          customShadow(),
          detailContent(),
        ],
      ),
    );
  }
}
