import 'package:easyplane_app/cubit/auth_cubit.dart';
import 'package:easyplane_app/cubit/page_cubit.dart';
import 'package:easyplane_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_button.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushNamedAndRemoveUntil(
                context, '/signin', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: navyColor,
              ),
            );
          } else if (state is AuthSuccess) {
            return profileCard(state, context);
          }
          return CustomButton(
            textButton: 'Sign Out',
            onPressedButton: () {
              context.read<AuthCubit>().signOut();
            },
            widthButton: 220,
          );
        },
      ),
    );
  }

  Center profileCard(AuthSuccess state, BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(defaultMargin),
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        height: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: blueText.copyWith(
                fontWeight: extrabold,
              ),
            ),
            Text(
              state.user.name,
              style: navyText.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 10),
            Text(
              "Email",
              style: blueText.copyWith(
                fontWeight: extrabold,
              ),
            ),
            Text(
              state.user.email,
              style: navyText.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 10),
            Text(
              "Hobby",
              style: blueText.copyWith(
                fontWeight: extrabold,
              ),
            ),
            Text(
              state.user.hobby == '' ? 'Update your hobby' : state.user.hobby,
              style: state.user.hobby == ''
                  ? greyText
                  : navyText.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 10),
            CustomButton(
                textButton: 'Sign Out',
                onPressedButton: () {
                  context.read<AuthCubit>().signOut();
                })
          ],
        ),
      ),
    );
  }
}
