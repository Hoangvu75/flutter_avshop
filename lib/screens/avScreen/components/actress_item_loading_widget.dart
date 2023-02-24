import 'package:avshop/generated/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../generated/PColor.dart';
import '../../../generated/assets.dart';


class ActressItemLoading extends StatelessWidget {
  const ActressItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15 * responsiveSize.width,
          ),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(136, 136, 136, 1.0),
              Color.fromRGBO(255, 255, 255, 1.0),
            ],
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 10 * responsiveSize.width,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8 * responsiveSize.width,
            vertical: 8 * responsiveSize.height,
          ),
          child: SizedBox(
            width: 150,
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 200,
                      width: 150,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 5 * responsiveSize.height),
                Text.rich(
                  TextSpan(
                    text: "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15 * responsiveSize.width,
                      color: PColors.defaultTextColor,
                      fontFamily: Assets.fontsSVNGilroyRegular,
                    ),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
