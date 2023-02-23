import 'package:flutter/material.dart';
import 'package:megashop/generated/app_utils.dart';

import '../../../generated/assets.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login",
            style: Theme.of(context).textTheme.headline1!.copyWith(
              color: Colors.white,
              fontFamily: Assets.fontsSVNGilroySemiBold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20 * responsiveSize.height,
          ),
          Text(
            "Let's connect with megashop\nand explore technology",
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.white,
              fontFamily: Assets.fontsSVNGilroyRegular,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
