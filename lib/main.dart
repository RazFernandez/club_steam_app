import 'package:club_steam_app/views/login_workflow/login.dart';
import 'package:club_steam_app/views/home.dart';
import 'package:club_steam_app/views/login_workflow/registration_email/registration_view.dart';
import 'package:club_steam_app/views/login_workflow/registration_email/profileImage.dart';
import 'package:club_steam_app/views/login_workflow/registration_email/register.dart';
import 'package:flutter/material.dart';
import 'utils/util.dart';
import 'utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'services/firebase_options.dart';
import 'package:club_steam_app/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'club-steam',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Open Sans", "Montserrat");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Club Steam',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: RegisterFormView(),
    );
  }

// Correct this properly

// Move to another method
  Widget _checkUserLogin() {
    if (AuthController().checkUserLogin() == true) {
      return HomeView();
    } else {
      return LoginView();
    }
  }
}
