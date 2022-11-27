import 'package:easyplane_app/cubit/page_cubit.dart';
import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/pages/home_page.dart';
import 'package:easyplane_app/ui/pages/setting_page.dart';
import 'package:easyplane_app/ui/pages/transaction_page.dart';
import 'package:easyplane_app/ui/pages/wallet_page.dart';
import 'package:easyplane_app/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
      }
      return const HomePage();
    }

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
                index: 0,
                imageUrl: 'assets/icons/icon_home.png',
              ),
              CustomBottomNavItem(
                index: 1,
                imageUrl: 'assets/icons/icon_booking.png',
              ),
              CustomBottomNavItem(
                index: 2,
                imageUrl: 'assets/icons/icon_card.png',
              ),
              CustomBottomNavItem(
                index: 3,
                imageUrl: 'assets/icons/icon_settings.png',
              )
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
