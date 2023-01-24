import 'package:easyplane_app/cubit/page_cubit.dart';
import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckout extends StatelessWidget {
  const SuccessCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/image_booked.png",
                  ),
                ),
              ),
            ),
            Text(
              "Well Booked 😍",
              style: navyText.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Are you ready to explore the new\nworld of experiences?",
              style: greyText.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              textButton: "My Bookings",
              widthButton: 220,
              marginButton: EdgeInsets.only(
                top: 50,
              ),
              onPressedButton: () {
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
