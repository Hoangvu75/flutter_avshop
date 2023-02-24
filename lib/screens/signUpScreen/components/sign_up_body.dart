import 'package:avshop/screens/signUpScreen/components/re_enter_password_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../generated/PColor.dart';
import '../../../generated/app_utils.dart';
import '../../../generated/assets.dart';
import '../../../widgets/gradient_button.dart';
import '../../loginScreen/components/password_text_field.dart';
import '../../loginScreen/components/phone_text_field.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody({
    Key? key,
  }) : super(key: key);

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reEnterPasswordController = TextEditingController();

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
                SizedBox(height: 16 * responsiveSize.height),
                ReEnterPasswordTextField(reEnterPasswordController: reEnterPasswordController),
              ],
            ),
            SizedBox(height: 40 * responsiveSize.height),
            Column(
              children: [
                GradientButton(
                  title: "Sign up",
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 40 * responsiveSize.height),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: PColors.defaultTextColor,
                          fontFamily: Assets.fontsSVNGilroyRegular,
                        ),
                  ),
                  TextSpan(
                    text: "Login",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: PColors.blueMain,
                          fontFamily: Assets.fontsSVNGilroySemiBold,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
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
