import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:pinterest_clone_app/domain/services/session_service.dart';
import '../../domain/models/user_details_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _userId;
  UserDetailsModel? _user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  // load user from hive
  Future<void> _loadUser() async {
    final userId = await SessionService.getUserId();

    if (userId != null) {
      final box = Hive.box<UserDetailsModel>('userBox');
      final user = box.get(userId);

      setState(() {
        _userId = userId;
        _user = user;
      });
    }
  }

  // logout
  Future<void> _logout(BuildContext context) async {
    final auth = ClerkAuth.of(context);

    await SessionService.clear();
    await auth.signOut();

    context.go('/auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_user != null) ...[
              Text("User ID: ${_user!.userId}"),
              Text("Age: ${_user!.age}"),
              Text("Gender: ${_user!.gender}"),
              Text("Region: ${_user!.region}"),
              Text("Interests: ${_user!.interests.join(', ')}"),
              const SizedBox(height: 20),
            ] else ...[
              const Text("No user found in Hive"),
              const SizedBox(height: 20),
            ],

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _logout(context),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
