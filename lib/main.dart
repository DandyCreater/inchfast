import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/routes/route.dart';
import 'core/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return MaterialApp.router(
            title: 'InchFast',
            routerConfig: router,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: UIColors.whiteColor,
                foregroundColor: UIColors.whiteColor,
              ),
              scaffoldBackgroundColor: UIColors.whiteColor,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        });
  }
}
