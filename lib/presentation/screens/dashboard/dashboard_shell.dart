import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinterest_clone_app/presentation/screens/dashboard/create_tab.dart';

class DashboardShell extends StatelessWidget {
  final Widget child;
  const DashboardShell({super.key, required this.child});

  void _showCreateSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => const CreateBottomSheet(),
  );
}


  int _indexFromLocation(String location) {
    if (location.startsWith('/search')) return 1;
    if (location.startsWith('/inbox')) return 3;
    if (location.startsWith('/saved')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final index = _indexFromLocation(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
  currentIndex: index,
  type: BottomNavigationBarType.fixed,

  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.white54,

  selectedLabelStyle: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 13,
  ),
  unselectedLabelStyle: const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
  ),

  selectedIconTheme: const IconThemeData(
    size: 28,
  ),
  unselectedIconTheme: const IconThemeData(
    size: 24,
  ),

  onTap: (i) {
    switch (i) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:

        _showCreateSheet(context); 
        break;
      case 3:
        context.go('/inbox');
        break;
      case 4:
        context.go('/saved');
        break;
    }
  },

  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline),
      label: 'Inbox',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined),
      label: 'Saved',
    ),
  ],
),
    );
  }
}

