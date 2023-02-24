import 'package:avshop/screens/avScreen/av_screen.dart';
import 'package:flutter/material.dart';

import '../../../generated/PColor.dart';
import '../../../generated/app_utils.dart';
import '../../../generated/assets.dart';

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.background,
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          const AvScreen(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 50 * responsiveSize.width,
        height: 50 * responsiveSize.height,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: PColors.blueMain,
          onPressed: () {},
          child: const Icon(Icons.qr_code_scanner), //icon inside button
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: PColors.background,
        shape: const CircularNotchedRectangle(),
        notchMargin: 7 * responsiveSize.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopify, color: _currentIndex == 0 ? PColors.lightOrange : PColors.blueMain),
                    Text(
                      "AVShop",
                      style: TextStyle(
                        color: _currentIndex == 0 ? PColors.lightOrange : PColors.blueMain,
                        fontFamily: Assets.fontsSVNGilroyRegular,
                        fontSize: 10 * responsiveSize.width,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search, color: _currentIndex == 1 ? PColors.lightOrange : PColors.blueMain),
                    Text(
                      "Search",
                      style: TextStyle(
                        color: _currentIndex == 1 ? PColors.lightOrange : PColors.blueMain,
                        fontFamily: Assets.fontsSVNGilroyRegular,
                        fontSize: 10 * responsiveSize.width,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.recommend_outlined,
                        color: _currentIndex == 2 ? PColors.lightOrange : PColors.blueMain),
                    Text(
                      "Suggest",
                      style: TextStyle(
                        color: _currentIndex == 2 ? PColors.lightOrange : PColors.blueMain,
                        fontFamily: Assets.fontsSVNGilroyRegular,
                        fontSize: 10 * responsiveSize.width,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.account_circle_outlined,
                        color: _currentIndex == 3 ? PColors.lightOrange : PColors.blueMain),
                    Text(
                      "Account",
                      style: TextStyle(
                        color: _currentIndex == 3 ? PColors.lightOrange : PColors.blueMain,
                        fontFamily: Assets.fontsSVNGilroyRegular,
                        fontSize: 10 * responsiveSize.width,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

