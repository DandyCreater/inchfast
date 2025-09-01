import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shake/shake.dart';

import 'core/config/helper/custom_animation.dart';
import 'core/config/routes/route.dart';
import 'core/theme/colors.dart';
import 'core/config/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ShakeDetector? shakeDetector;
  void _listenShakeDetector() {
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: (onPhoneShake) {
        ChuckerFlutter.showChuckerScreen();
      },
      shakeSlopTimeMS: 3000,
    );
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false
      ..customAnimation = CustomAnimation();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listenShakeDetector();
  }

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
            builder: EasyLoading.init(),
          );
        });
  }
}
