import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/screen/login.screen.dart';
import '../../../features/main-feature/domain/entity/unloading.entity.dart';
import '../../../features/main-feature/domain/entity/moving_box.entity.dart'
    as movingBox;
import '../../../features/main-feature/presentation/screen/dashboard.screen.dart';
import '../../../features/main-feature/presentation/screen/moving.screen.dart';
import '../../../features/main-feature/presentation/screen/moving_box_to_building.screen.dart';
import '../../../features/main-feature/presentation/screen/moving_box_to_building_detail.screen.dart';
import '../../../features/main-feature/presentation/screen/moving_box_to_high_rack.screen.dart';
import '../../../features/main-feature/presentation/screen/ncp.screen.dart';
import '../../../features/main-feature/presentation/screen/unloading.screen.dart';
import '../../../features/main-feature/presentation/screen/unloading_detail.screen..dart';
import '../../../features/main-feature/presentation/screen/unpack.screen.dart';

class AppRoutes {
  const AppRoutes._();

  static const login = '/';
  static const dashboard = '/dashboard';
  static const moving = '/moving';
  static const movingBoxToBuilding = '/moving-box-to-buiding';
  static const movingBoxToHighRack = '/moving-box-to-high-rack';
  static const movingBoxToBuildingDetail = '/moving-box-to-building-detail';
  static const ncp = '/ncp';
  static const unloading = '/unloading';
  static const unpack = '/unpack';
  static const unloadingDetail = '/unloading-detail';

  static final List<RouteBase> routes = [
    GoRoute(
      path: login,
      name: login,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
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
              },
              routes: [
                GoRoute(
                    path: movingBoxToBuilding,
                    name: movingBoxToBuilding,
                    builder: (BuildContext context, GoRouterState state) {
                      return const MovingBoxToBuildingScreen();
                    },
                    routes: [
                      GoRoute(
                          path: movingBoxToBuildingDetail,
                          name: movingBoxToBuildingDetail,
                          builder: (BuildContext context, GoRouterState state) {
                            final args =
                                state.extra as List<movingBox.DetailBoxEntity>?;
                            return MovingBoxToBuildingDetailScreen(
                                detailBox: args);
                          }),
                    ]),
                GoRoute(
                    path: movingBoxToHighRack,
                    name: movingBoxToHighRack,
                    builder: (BuildContext context, GoRouterState state) {
                      return const MovingBoxToHighRackScreen();
                    })
              ]),
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
              },
              routes: [
                GoRoute(
                    path: unloadingDetail,
                    name: unloadingDetail,
                    builder: (BuildContext context, GoRouterState state) {
                      final args = state.extra as List<DetailBoxEntity>?;
                      return UnloadingDetailScreen(detailBox: args);
                    }),
              ]),
          GoRoute(
              path: unpack,
              name: unpack,
              builder: (BuildContext context, GoRouterState state) {
                return const UnpackScreen();
              }),
        ]),
  ];
}

GoRouter get router => GoRouter(
    observers: [ChuckerFlutter.navigatorObserver], routes: AppRoutes.routes);
