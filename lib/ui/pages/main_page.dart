import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/widgets/bottom_navigation_item.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bottom navigation
    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavItem(
                  imageUrl: 'assets/icons/icon_home.png', isSelected: true),
              CustomBottomNavItem(imageUrl: 'assets/icons/icon_booking.png'),
              CustomBottomNavItem(imageUrl: 'assets/icons/icon_card.png'),
              CustomBottomNavItem(imageUrl: 'assets/icons/icon_settings.png')
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Text('Main Page'),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
