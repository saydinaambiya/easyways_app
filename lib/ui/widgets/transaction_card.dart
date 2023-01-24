import 'package:easyplane_app/models/transaction_model.dart';
import 'package:easyplane_app/ui/widgets/booking_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
