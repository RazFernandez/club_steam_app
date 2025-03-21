import 'package:flutter/material.dart';
import 'package:club_steam_app/views/login_workflow/registration_email/profile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        // Changes the selected option in the navbar
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        // Icons of the navbar
        destinations: const <Widget>[
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home'),
          NavigationDestination(
              selectedIcon: Icon(Icons.folder),
              icon: Icon(Icons.folder_open),
              label: 'Proyectos'),
          NavigationDestination(
              selectedIcon: Icon(Icons.notifications),
              icon: Icon(Icons.notifications_none),
              label: 'Notificaciones'),
          NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_2_outlined),
              label: 'Perfil'),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        /* 
        Do not forget to modify the pages with the
        current ones later on
         */
        children: <Widget>[
          // Home page
          Center(
            child: Text(
              'Bienvenido Colaborador',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),

          // Proyectos
          Center(
            child: Text(
              'Proyectos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),

          // Notificaciones
          Center(
            child: Text(
              'Notificaciones',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),

          // Perfil
          ProfileView(),
        ],
      ),
    );
  }
}
