import 'package:go_router/go_router.dart';
import 'package:club_steam_app/routes/auth_routes.dart';
import 'package:club_steam_app/services/Auth/auth_service.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) {
    final isUserLogged = AuthService().checkUserLoggedIn();
    final path = state.matchedLocation;

    // Add recover-password if needed
    final publicRoutes = [
      '/login',
      '/register',
      '/verify-email',
    ];

    final isPublicRoute = publicRoutes.contains(path);

    // If not logged in and trying to access private route → send to login
    if (!isUserLogged && !isPublicRoute) return '/login';

    // If logged in and trying to access a public route (like login or register) → send to home
    if (isUserLogged && isPublicRoute) return '/home';

    // All good, allow navigation
    return null;
  },
  routes: [
    ...authRoutes,
  ],
);
