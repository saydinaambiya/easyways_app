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
    return Center(
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
}
