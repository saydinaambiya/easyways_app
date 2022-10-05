import 'package:easyplane_app/shared/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.only(
                bottom: 50,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/icon_plan.png',
                  ),
                ),
              ),
            ),
            Text(
              'EASYPLAN',
              style: whiteText.copyWith(
                fontWeight: medium,
                fontSize: 32,
                letterSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
