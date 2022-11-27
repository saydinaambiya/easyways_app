import 'package:easyplane_app/cubit/auth_cubit.dart';
import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/widgets/custom_button.dart';
import 'package:easyplane_app/ui/widgets/cutom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    //title text
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 30,
        ),
        child: Text(
          'Join us and get\nyour next journey',
          style: navyText.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      //name textformfield
      Widget nameInput() {
        return CustomTextFormField(
          titleInput: 'Full Name',
          hintInput: 'Your full name',
          controller: nameController,
        );
      }

      //email textformfield
      Widget emailInput() {
        return CustomTextFormField(
          titleInput: 'Email Address',
          hintInput: 'Your email address',
          controller: emailController,
        );
      }

      //name textformfield
      Widget passwordInput() {
        return CustomTextFormField(
          obscureTextInput: true,
          titleInput: 'Password',
          hintInput: 'Your password',
          controller: passwordController,
        );
      }

      //name textformfield
      Widget hobbyInput() {
        return CustomTextFormField(
          titleInput: 'Hobby',
          hintInput: 'Your hobby',
          controller: hobbyController,
        );
      }

      //submit button (getstarted)
      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/bonus', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: pinkColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return CustomButton(
                marginButton: EdgeInsets.only(bottom: 30),
                textButton: 'Get Started',
                onPressedButton: () {
                  context.read<AuthCubit>().signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        hobby: hobbyController.text,
                      );
                });
          },
        );
      }

      //terms and conditions
      Widget termsButton() {
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: 50,
            bottom: 73,
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

      //container for textformfield and button
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Column(
              children: [
                nameInput(),
                emailInput(),
                passwordInput(),
                hobbyInput(),
                const SizedBox(height: 10),
                submitButton(),
              ],
            ),
          ),
          termsButton(),
        ],
      );
    }

    //scaffold to load title, form, and button
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            title(),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
