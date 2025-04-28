// scaffold_with_navbar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPageView extends StatelessWidget {
  const MainPageView(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  bool _isSubRoute(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    // Example: hide nav bar for deeper profile routes
    if (location.startsWith('/profile/') && location != '/profile') {
      return true;
    }

    // Add more patterns here if necessary
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final bool hideNavBar = _isSubRoute(context);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: hideNavBar
          ? null
          : NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
              destinations: const [
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.folder),
                  icon: Icon(Icons.folder_open),
                  label: 'Proyectos',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.notifications),
                  icon: Icon(Icons.notifications_none),
                  label: 'Notificaciones',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_2_outlined),
                  label: 'Perfil',
                ),
              ],
            ),
    );
  }
}
