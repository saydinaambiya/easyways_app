import 'package:easyplane_app/cubit/seat_cubit.dart';
import 'package:easyplane_app/models/destination_model.dart';
import 'package:easyplane_app/models/transaction_model.dart';
import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/pages/checkout_page.dart';
import 'package:easyplane_app/ui/widgets/custom_button.dart';
import 'package:easyplane_app/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;

  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

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
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
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
                      SeatItem(
                        id: 'A1',
                      ),
                      SeatItem(
                        id: 'B1',
                        isAvailable: false,
                      ),
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
                      SeatItem(
                        id: 'C1',
                      ),
                      SeatItem(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),

                //NOTE : SEAT 2
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A2',
                      ),
                      SeatItem(
                        id: 'B2',
                      ),
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
                      SeatItem(
                        id: 'C2',
                      ),
                      SeatItem(
                        id: 'D2',
                      ),
                    ],
                  ),
                ),

                //NOTE : SEAT 3
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A3',
                      ),
                      SeatItem(
                        id: 'B3',
                      ),
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
                      SeatItem(
                        id: 'C3',
                      ),
                      SeatItem(
                        id: 'D3',
                      ),
                    ],
                  ),
                ),

                //NOTE : SEAT 4
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A4',
                      ),
                      SeatItem(
                        id: 'B4',
                      ),
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
                      SeatItem(
                        id: 'C4',
                      ),
                      SeatItem(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),

                //NOTE : SEAT 5
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A5',
                      ),
                      SeatItem(
                        id: 'B5',
                      ),
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
                      SeatItem(
                        id: 'C5',
                      ),
                      SeatItem(
                        id: 'D5',
                      ),
                    ],
                  ),
                ),

                //NOTE: YOUR SEAT
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Seat',
                        style: greyText.copyWith(
                          fontWeight: light,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        state.join(', '),
                        style: navyText.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),

                //NOTE: TOTAL
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyText.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(state.length * destination.price),
                        style: navyText.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
              marginButton: const EdgeInsets.only(
                top: 30,
                bottom: 46,
              ),
              textButton: 'Continue to checkout',
              onPressedButton: () {
                int price = destination.price * state.length;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      TransactionModel(
                        destination: destination,
                        amountOfTraveler: state.length,
                        selectedSeat: state.join(', '),
                        insurance: true,
                        refundable: false,
                        vat: 0.45,
                        price: price,
                        grandTotal: price + (price * 0.45).toInt(),
                      ),
                    ),
                  ),
                );
              });
        },
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
            checkoutButton(),
          ],
        ),
      ),
    );
  }
}
