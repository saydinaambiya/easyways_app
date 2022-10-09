import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/background.png',
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly is EASY',
                  style: whiteText.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Explore new world with us and let\nyourself get an amazing experiences',
                  style: whiteText.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
                CustomButton(
                  textButton: 'Get Started',
                  onPressedButton: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  widthButton: 220,
                  marginButton: const EdgeInsets.only(
                    top: 50,
                    bottom: 80,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
