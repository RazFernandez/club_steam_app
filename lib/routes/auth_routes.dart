import 'package:go_router/go_router.dart';
import 'package:club_steam_app/views/login_workflow/login.dart';
import 'package:club_steam_app/views/login_workflow/registration_email/registration_view.dart';
import 'package:club_steam_app/views/login_workflow/registration_email/verificationEmail_view.dart';
import 'package:club_steam_app/views/ScaffoldWithNavBar.dart';
import 'package:club_steam_app/views/home.dart';

final List<GoRoute> authRoutes = [
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterFormView(),
  ),
  GoRoute(
    path: '/verify-email',
    builder: (context, state) => const VerificationEmailView(),
  ),
  GoRoute(path: '/home', builder: (context, state) => const HomeView()),
];
