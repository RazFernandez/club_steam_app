import 'package:go_router/go_router.dart';
import 'package:club_steam_app/routes/auth_routes.dart';
import 'package:club_steam_app/services/Auth/auth_service.dart';
import 'package:club_steam_app/routes/profile_router.dart';
import 'package:club_steam_app/routes/shell_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) async {
    final authService = AuthService();
    final path = state.matchedLocation;

    final publicRoutes = [
      '/login',
      '/register',
      '/verify-email',
    ];

    final isUserLogged = authService.checkUserLoggedIn();
    final isEmailVerified = await authService.checkEmailVerification();
    final isPublicRoute = publicRoutes.contains(path);

    // Not logged in → allow only public routes
    if (!isUserLogged && !isPublicRoute) {
      return '/login';
    }

    // Logged in but not verified → always go to verify-email
    if (isUserLogged && !isEmailVerified && path != '/verify-email') {
      return '/verify-email';
    }

    // Logged in and trying to access public route → send to home
    if (isUserLogged && isEmailVerified && isPublicRoute) {
      return '/home';
    }

    // All good, allow navigation
    return null;
  },
  routes: [
    ...authRoutes,
    buildShellRoute(),
  ],
);
