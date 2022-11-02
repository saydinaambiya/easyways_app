import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/widgets/seat_item.dart';
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'A',
                      style: greyText.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'B',
                      style: greyText.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '',
                      style: greyText.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'C',
                      style: greyText.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'D',
                      style: greyText.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),

            //NOTE : SEAT 1
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 2),
                  SeatItem(status: 2),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '1',
                        style: greyText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                ],
              ),
            ),

            //NOTE : SEAT 2
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '2',
                        style: greyText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                ],
              ),
            ),

            //NOTE : SEAT 3
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 1),
                  SeatItem(status: 1),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '3',
                        style: greyText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                ],
              ),
            ),

            //NOTE : SEAT 4
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '4',
                        style: greyText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                ],
              ),
            ),

            //NOTE : SEAT 5
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '5',
                        style: greyText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SeatItem(status: 2),
                  SeatItem(status: 0),
                ],
              ),
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
