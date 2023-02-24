import 'package:flutter/material.dart';

import '../../../generated/PColor.dart';
import '../../../generated/app_utils.dart';
import '../../../generated/assets.dart';

class ReEnterPasswordTextField extends StatefulWidget {
  const ReEnterPasswordTextField({
    Key? key,
    required this.reEnterPasswordController,
  }) : super(key: key);

  final TextEditingController reEnterPasswordController;

  @override
  State<ReEnterPasswordTextField> createState() => _ReEnterPasswordTextFieldState();
}

class _ReEnterPasswordTextFieldState extends State<ReEnterPasswordTextField> {
  bool obscureText = true;

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5 * responsiveSize.width,
        horizontal: 15 * responsiveSize.width,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color.fromRGBO(125, 125, 125, 1.0)),
        borderRadius: BorderRadius.circular(
          15 * responsiveSize.width,
        ),
      ),
      child: TextField(
        controller: widget.reEnterPasswordController,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Re-enter Password',
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: togglePasswordVisibility,
          ),
        ),
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: PColors.defaultTextColor,
              fontFamily: Assets.fontsSVNGilroyRegular,
            ),
      ),
    );
  }
}
