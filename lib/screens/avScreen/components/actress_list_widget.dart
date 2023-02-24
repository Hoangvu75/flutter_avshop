import 'package:avshop/generated/app_utils.dart';
import 'package:avshop/models/av_actress_response.dart';
import 'package:avshop/screens/avScreen/components/actress_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/svg.dart';
import '../../../generated/PColor.dart';
import '../../../generated/assets.dart';

class ActressListWidget extends StatelessWidget {
  final List<AvActress> actressList;
  final String title;

  const ActressListWidget({
    super.key,
    required this.actressList,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10 * responsiveSize.width),
          child: Text(
            title,
            style: TextStyle(
                color: PColors.blueMain,
                fontSize: 20 * responsiveSize.height,
                fontFamily: Assets.fontsSVNGilroyBold),
          ),
        ),
        SizedBox(height: 15 * responsiveSize.height),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [for (int i = 0; i < actressList.length; i++) ActressItem(avActress: actressList[i])],
                ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ScaleTap(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "View more",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15 * responsiveSize.width,
                        color: PColors.blueMain,
                        fontFamily: Assets.fontsSVNGilroyRegular,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(width: 10 * responsiveSize.width),
                  SvgPicture.asset(Assets.svgsIcUnion)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
