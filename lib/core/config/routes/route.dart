import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/main-feature/presentation/screen/dashboard.screen.dart';
import '../../../features/main-feature/presentation/screen/moving.screen.dart';
import '../../../features/main-feature/presentation/screen/ncp.screen.dart';
import '../../../features/main-feature/presentation/screen/unloading.screen.dart';
import '../../../features/main-feature/presentation/screen/unpack.screen.dart';

class AppRoutes {
  const AppRoutes._();

  static const dashboard = '/';
  static const moving = '/moving';
  static const ncp = '/ncp';
  static const unloading = '/unloading';
  static const unpack = '/unpack';

  static final List<RouteBase> routes = [
    GoRoute(
        path: dashboard,
        name: dashboard,
        builder: (BuildContext context, GoRouterState state) {
          return const DashboardScreen();
        },
        routes: [
          GoRoute(
              path: moving,
              name: moving,
              builder: (BuildContext context, GoRouterState state) {
                return const MovingScreen();
              }),
          GoRoute(
              path: ncp,
              name: ncp,
              builder: (BuildContext context, GoRouterState state) {
                return const NcpScreen();
              }),
          GoRoute(
              path: unloading,
              name: unloading,
              builder: (BuildContext context, GoRouterState state) {
                return const UnloadingScreen();
              }),
          GoRoute(
              path: unpack,
              name: unpack,
              builder: (BuildContext context, GoRouterState state) {
                return const UnpackScreen();
              }),
        ]),
  ];
}

GoRouter get router => GoRouter(routes: AppRoutes.routes);
