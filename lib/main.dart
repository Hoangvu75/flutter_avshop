import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:megashop/screens/loginScreen/login_screen.dart';
import 'package:megashop/splash.dart';

import 'generated/app_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login_screen': (context) => const LoginScreen(),
      },
      builder: _builder(),
    );
  }

  Widget Function(BuildContext, Widget?) _builder({Widget Function(BuildContext, Widget?)? builder}) {
    var newBuilder = EasyLoading.init(builder: builder);

    return (BuildContext context, Widget? child) {
      final mChild = child;
      if (mChild != null) {
        final widgetSize = MediaQuery.of(context).size;

        final mResponsiveWidth = widgetSize.width / 375; // 375: Design width
        final mResponsiveHeight = widgetSize.height / 812; // 812: Design height
        final mResponsiveSize = Size(mResponsiveWidth, mResponsiveHeight);

        if (mResponsiveWidth != responsiveSize.width || mResponsiveHeight != responsiveSize.height) {
          if (widgetSize.width > 650) {
            // AppUtils.isSuperBigPhone = true;
          }

          if (mResponsiveWidth > 1.2) {
            responsiveSize = Size(1.2, mResponsiveHeight);
          } else {
            responsiveSize = mResponsiveSize;
          }

          if (kDebugMode) {
            print(
                "widgetSize width: ${widgetSize.width}\nwidgetSize height: ${widgetSize.height}\nresponsiveSize: "
                    "$responsiveSize\nmResponsiveHeight: $mResponsiveHeight");
          }
        }

        return newBuilder(
          context,
          MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: mChild,
          ),
        );
      }

      return Container();
    };
  }
}
