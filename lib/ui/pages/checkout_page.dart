import 'package:easyplane_app/cubit/auth_cubit.dart';
import 'package:easyplane_app/cubit/transaction_cubit.dart';
import 'package:easyplane_app/models/transaction_model.dart';
import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/pages/success_checkout_page.dart';
import 'package:easyplane_app/ui/widgets/booking_details_item.dart';
import 'package:easyplane_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 291,
              height: 55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/icon_flyplane.png',
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: navyText.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Tanggerang',
                      style: greyText.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: navyText.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Ciliwung',
                      style: greyText.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NOTE : DESTINATION TILE
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        transaction.destination.imageUrl,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: navyText.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        transaction.destination.city,
                        style: greyText.copyWith(
                          fontWeight: light,
                        ),
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
                      transaction.destination.rating.toString(),
                      style: navyText.copyWith(
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ],
            ),
            //NOTE : BOOKING DETAILS TEXT
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Booking Details',
                style: navyText.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
            //NOTE : BOOKING DETAILS ITEM
            BookingDetailsItem(
              title: "Traveler",
              valueText: '${transaction.amountOfTraveler} person',
              valueColor: navyColor,
            ),
            BookingDetailsItem(
              title: "Seat",
              valueText: transaction.selectedSeat,
              valueColor: navyColor,
            ),
            BookingDetailsItem(
              title: "Insurance",
              valueText: transaction.insurance ? "YES" : "NO",
              valueColor: transaction.insurance ? greenColor : pinkColor,
            ),
            BookingDetailsItem(
              title: "Refundable",
              valueText: transaction.refundable ? "YES" : "NO",
              valueColor: transaction.refundable ? greenColor : pinkColor,
            ),
            BookingDetailsItem(
              title: "VAT",
              valueText: "${(transaction.vat * 100).toStringAsFixed(0)}%",
              valueColor: navyColor,
            ),
            BookingDetailsItem(
              title: "Price",
              valueText: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transaction.price),
              valueColor: navyColor,
            ),
            BookingDetailsItem(
              title: "Grand Total",
              valueText: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transaction.grandTotal),
              valueColor: primaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Details",
                    style: navyText.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/card_image.png",
                              ),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(
                                    right: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/icons/icon_plane.png",
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Pay",
                                  style: whiteText.copyWith(
                                    fontSize: 16,
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'IDR ',
                                        decimalDigits: 0)
                                    .format(state.user.balance),
                                style: navyText.copyWith(
                                  fontSize: 18,
                                  fontWeight: medium,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Current Balance",
                                style: greyText.copyWith(
                                  fontWeight: light,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      );
    }

    Widget payButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: pinkColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            textButton: "Pay Now",
            marginButton: EdgeInsets.symmetric(
              vertical: 30,
            ),
            onPressedButton: () {
              context.read<TransactionCubit>().createTransaction(transaction);
            },
          );
        },
      );
    }

    Widget termsButton() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Text(
          'Terms and Conditions',
          style: greyText.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            route(),
            bookingDetails(),
            paymentDetails(),
            payButton(),
            termsButton(),
          ],
        ),
      ),
    );
  }
}
