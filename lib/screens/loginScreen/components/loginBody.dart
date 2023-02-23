import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:megashop/screens/loginScreen/components/passwordTextField.dart';
import 'package:megashop/screens/loginScreen/components/phoneTextField.dart';
import 'package:megashop/widgets/gradient_button_loading.dart';

import '../../../generated/PColor.dart';
import '../../../generated/app_utils.dart';
import '../../../generated/assets.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
    required this.phoneController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 7,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
            color: PColors.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Column(
          children: [
            PhoneTextField(phoneController: phoneController),
            const SizedBox(height: 16.0),
            PasswordTextField(passwordController: passwordController),
            const SizedBox(height: 40.0),
            GradientButtonLoading(
              title: "Login",
              isLoading: false,
              onTap: () {},
            ),
            SizedBox(
              height: 40 * responsiveSize.height,
            ),
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
                      ..onTap = () {},
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
