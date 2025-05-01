import 'package:go_router/go_router.dart';
import 'package:club_steam_app/views/profile_workflow/profile.dart';
import 'package:club_steam_app/views/profile_workflow/profile_features/deleteAccount.dart';
import 'package:club_steam_app/views/profile_workflow/profile_features/editAccount.dart';

final List<GoRoute> profileRoutes = [
  GoRoute(
    path: '/profile',
    builder: (context, state) => const ProfileView(),
    routes: [
      GoRoute(
        path: 'delete-account',
        builder: (context, state) => const DeleteAccountView(),
      ),
      GoRoute(
        path: 'edit-account',
        builder: (context, state) => const EditAccountView(),
      ),
    ],
  ),
];
