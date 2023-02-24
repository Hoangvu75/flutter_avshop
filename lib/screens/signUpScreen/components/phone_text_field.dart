import 'package:flutter/material.dart';
import 'package:avshop/generated/app_utils.dart';

import '../../../generated/PColor.dart';
import '../../../generated/assets.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key? key,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5 * responsiveSize.width,
        horizontal: 15 * responsiveSize.width,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1 * responsiveSize.width, color: const Color.fromRGBO(125, 125, 125, 1.0)),
        borderRadius: BorderRadius.circular(
          15 * responsiveSize.width,
        ),
      ),
      child: TextField(
        controller: phoneController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Phone number',
        ),
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: PColors.defaultTextColor,
              fontFamily: Assets.fontsSVNGilroyRegular,
            ),
      ),
    );
  }
}
