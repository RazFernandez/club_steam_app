import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:club_steam_app/views/home.dart';
import 'package:club_steam_app/views/profile_workflow/profile.dart';
import 'package:club_steam_app/views/profile_workflow/profile_features/deleteAccount.dart';
import 'package:club_steam_app/views/ScaffoldWithNavBar.dart';
import 'package:club_steam_app/routes/profile_router.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

StatefulShellRoute buildShellRoute() {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return ScaffoldWithNavBar(navigationShell);
    },
    branches: [
      // Branch 0: Home
      StatefulShellBranch(
        navigatorKey: _shellNavigatorKey,
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => Center(
              child: Text('Proyectos', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),

      // Branch 1: Projects
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/projects',
            builder: (context, state) => Center(
              child: Text('Proyectos', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),

      // Branch 2: Notifications
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/notifications',
            builder: (context, state) => Center(
              child: Text('Notificaciones', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),

      // Branch 3: Profile
      StatefulShellBranch(
        routes: [
          ...profileRoutes,
        ],
      ),
    ],
  );
}
