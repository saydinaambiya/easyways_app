import 'package:easyplane_app/cubit/auth_cubit.dart';
import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/widgets/custom_button.dart';
import 'package:easyplane_app/ui/widgets/cutom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

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
          'Sign In\nYour Account',
          style: navyText.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      //email textformfield
      Widget emailInput() {
        return CustomTextFormField(
          titleInput: 'Email Address',
          hintInput: 'Your email address',
          controller: emailController,
        );
      }

      //password textformfield
      Widget passwordInput() {
        return CustomTextFormField(
          obscureTextInput: true,
          titleInput: 'Password',
          hintInput: 'Your password',
          controller: passwordController,
        );
      }

      //submit button (getstarted)
      Widget signInButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
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
                textButton: 'Sign In',
                onPressedButton: () {
                  context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text);
                });
          },
        );
      }

      //sign up button
      Widget signUpButton() {
        return GestureDetector(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: 50,
              bottom: 73,
            ),
            child: Text(
              "Don't have an accout? Sign Up",
              style: greyText.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/signup');
          },
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
                emailInput(),
                passwordInput(),
                const SizedBox(height: 10),
                signInButton(),
              ],
            ),
          ),
          signUpButton(),
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
