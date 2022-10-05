import 'package:easyplane_app/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      //textformfield
      Widget textInput(String titleInput, String hintInput) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleInput,
                style: navyText,
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                cursorColor: navyColor,
                decoration: InputDecoration(
                  hintText: hintInput,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      //textformfield password
      Widget passwordInput() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: navyText,
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                obscureText: true,
                cursorColor: navyColor,
                decoration: InputDecoration(
                  hintText: 'Your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      // Widget emailInput() {
      //   return Container(
      //     margin: const EdgeInsets.only(bottom: 20),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           'Email Address',
      //         ),
      //         const SizedBox(
      //           height: 6,
      //         ),
      //         TextFormField(
      //           cursorColor: navyColor,
      //           decoration: InputDecoration(
      //             hintText: 'Your email',
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(
      //                 defaultRadius,
      //               ),
      //             ),
      //             focusedBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(
      //                 defaultRadius,
      //               ),
      //               borderSide: BorderSide(
      //                 color: primaryColor,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   );
      // }

      //submit button (getstarted)
      Widget submitButton() {
        return Container(
          width: double.infinity,
          height: 55,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                )),
            child: Text(
              'Get Started',
              style: whiteText.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ),
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
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            textInput("Full Name", "Your full name"),
            textInput("Email Address", "Your email address"),
            passwordInput(),
            textInput("Hobby", "Your hobby"),
            const SizedBox(height: 10),
            submitButton(),
            termsButton(),
          ],
        ),
      );
    }

    //scaffold to load title, form, and button
    return Scaffold(
      backgroundColor: whiteColor,
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
