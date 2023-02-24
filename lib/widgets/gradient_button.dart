import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:avshop/generated/app_utils.dart';

import '../generated/PColor.dart';
import '../generated/assets.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final String assetsIcon;
  final bool isLeft;
  final List<Color>? colors;

  const GradientButton({
    super.key,
    required this.title,
    this.onTap,
    this.assetsIcon = "",
    this.isLeft = true,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      enableFeedback: false,
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: colors ??
                [
                  PColors.gradientButtonStart,
                  PColors.gradientButtonEnd,
                ],
          ),
          border: Border.all(color: PColors.blueMain),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10 * responsiveSize.width,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20 * responsiveSize.width,
            vertical: 20 * responsiveSize.height,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: _checkVisibleLeft(),
                child: SvgPicture.asset(
                  assetsIcon,
                  width: 25 * responsiveSize.width,
                  height: 25 * responsiveSize.height,
                  color: Colors.white,
                ),
              ),
              Visibility(
                visible: _checkVisibleLeft(),
                child: SizedBox(
                  width: 10 * responsiveSize.width,
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontFamily: Assets.fontsSVNGilroyMedium,
                    ),
              ),
              Visibility(
                visible: _checkVisibleRight(),
                child: SizedBox(
                  width: 10 * responsiveSize.width,
                ),
              ),
              Visibility(
                visible: _checkVisibleRight(),
                child: SvgPicture.asset(
                  assetsIcon,
                  width: 25 * responsiveSize.width,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _checkVisibleLeft() {
    if (assetsIcon.isEmpty) {
      return false;
    } else {
      if (isLeft == true) return true;
    }
    return false;
  }

  bool _checkVisibleRight() {
    if (assetsIcon.isEmpty) {
      return false;
    } else {
      if (isLeft == false) return true;
    }
    return false;
  }
}
