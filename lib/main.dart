import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/foundation.dart';
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

  @override
  void initState() {
    super.initState();
    _listenShakeDetector();
    _configLoading();
  }

  void _listenShakeDetector() {
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: (onPhoneShake) {
        ChuckerFlutter.showChuckerScreen();
      },
      shakeSlopTimeMS: 3000,
    );
  }

  void _configLoading() {
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
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: !kIsWeb, // penting
      splitScreenMode: !kIsWeb, // penting
      builder: (_, child) {
        return MaterialApp.router(
          builder: (context, widget) {
            return widget!; // NO MORE MEDIAQUERY OVERRIDE
          },
          routerConfig: router,
          theme: ThemeData(useMaterial3: true),
        );
      },
    );
  }
}
