import 'package:easyplane_app/shared/theme.dart';
import 'package:flutter/material.dart';

class ChooseSeatPage extends StatefulWidget {
  const ChooseSeatPage({Key? key}) : super(key: key);

  @override
  State<ChooseSeatPage> createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        child: Text(
          'Select Your\nFavorite Seat',
          style: navyText.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget setStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            //NOTE : AVAILABLE
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/icon_available.png'),
                ),
              ),
            ),
            Text(
              'Available',
              style: navyText,
            ),
            //NOTE : SELECTED
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/icon_selected.png'),
                ),
              ),
            ),
            Text(
              'Selected',
              style: navyText,
            ),
            //NOTE : UNAVAILABLE
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/icon_unavailable.png'),
                ),
              ),
            ),
            Text(
              'Unavailable',
              style: navyText,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: whiteColor,
        ),
        child: Column(
          children: [
            //NOTE: SEAT INDICATORS
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'A',
                      style: greyText.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'B',
                      style: greyText.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '',
                      style: greyText.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'C',
                      style: greyText.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'D',
                      style: greyText.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            setStatus(),
            selectSeat(),
          ],
        ),
      ),
    );
  }
}
