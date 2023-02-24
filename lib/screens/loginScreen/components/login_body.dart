import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../generated/PColor.dart';
import '../../../generated/app_utils.dart';
import '../../../generated/assets.dart';
import '../../../widgets/gradient_button_loading.dart';
import '../../mainScreen/main_screen.dart';
import '../../signUpScreen/components/password_text_field.dart';
import '../../signUpScreen/components/phone_text_field.dart';
import '../../signUpScreen/sign_up_screen.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool gradientButtonLoading = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 7,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 50 * responsiveSize.height,
          horizontal: 20 * responsiveSize.width,
        ),
        decoration: BoxDecoration(
            color: PColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30 * responsiveSize.width),
              topRight: Radius.circular(30 * responsiveSize.width),
            )),
        child: Column(
          children: [
            Column(
              children: [
                PhoneTextField(phoneController: phoneController),
                SizedBox(height: 16 * responsiveSize.height),
                PasswordTextField(passwordController: passwordController),
              ],
            ),
            SizedBox(height: 40 * responsiveSize.height),
            GradientButtonLoading(
              title: "Login",
              isLoading: gradientButtonLoading,
              onTap: () {
                setState(() {
                  gradientButtonLoading = true;
                });
                Future.delayed(
                  const Duration(seconds: 3),
                  () {
                    setState(() {
                      gradientButtonLoading = false;
                    });
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const MainScreen(),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 40 * responsiveSize.height),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Did You have an Account? ",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: PColors.defaultTextColor,
                          fontFamily: Assets.fontsSVNGilroyRegular,
                        ),
                  ),
                  TextSpan(
                    text: "Sign up",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: PColors.blueMain,
                          fontFamily: Assets.fontsSVNGilroySemiBold,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const SignUpScreen(),
                            duration: const Duration(milliseconds: 500),
                          ),
                        );
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
