import 'package:avshop/generated/app_utils.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
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
            "Sign up",
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
            "Let's connect with AVShop\nand explore AV world",
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
