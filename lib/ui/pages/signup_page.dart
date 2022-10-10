import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/widgets/custom_button.dart';
import 'package:easyplane_app/ui/widgets/cutom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
        return const CustomTextFormField(
          titleInput: 'Full Name',
          hintInput: 'Your full name',
        );
      }

      //email textformfield
      Widget emailInput() {
        return const CustomTextFormField(
          titleInput: 'Email Address',
          hintInput: 'Your email address',
        );
      }

      //name textformfield
      Widget passwordInput() {
        return const CustomTextFormField(
          obscureTextInput: true,
          titleInput: 'Password',
          hintInput: 'Your password',
        );
      }

      //name textformfield
      Widget hobbyInput() {
        return const CustomTextFormField(
          titleInput: 'Hobby',
          hintInput: 'Your hobby',
        );
      }

      //submit button (getstarted)
      Widget submitButton() {
        return CustomButton(
            textButton: 'Get Started',
            onPressedButton: () {
              Navigator.pushNamed(context, '/bonus');
            });
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
      return Container(
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
            termsButton(),
          ],
        ),
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
