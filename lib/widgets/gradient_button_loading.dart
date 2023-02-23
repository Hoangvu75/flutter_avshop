import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:megashop/generated/app_utils.dart';
import 'package:megashop/generated/assets.dart';

import '../generated/PColor.dart';

class GradientButtonLoading extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Function() onTap;

  const GradientButtonLoading({
    super.key,
    required this.title,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ScaleTap(
        onPressed: () {},
        enableFeedback: false,
        child: Container(
          height: 60 * responsiveSize.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                PColors.gradientButtonStart,
                PColors.gradientButtonEnd,
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10 * responsiveSize.width,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20 * responsiveSize.width,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontFamily: Assets.fontsSVNGilroyMedium,
                      ),
                ),
                SizedBox(
                  width: 10 * responsiveSize.width,
                ),
                Center(
                  heightFactor: 1,
                  widthFactor: 1,
                  child: SizedBox(
                    height: 20 * responsiveSize.width,
                    width: 20 * responsiveSize.width,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: PColors.blueMain,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return ScaleTap(
        onPressed: onTap,
        child: Container(
          height: 60 * responsiveSize.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                PColors.gradientButtonStart,
                PColors.gradientButtonEnd,
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10 * responsiveSize.width,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20 * responsiveSize.width,
            ),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontFamily: Assets.fontsSVNGilroyMedium,
                    ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
