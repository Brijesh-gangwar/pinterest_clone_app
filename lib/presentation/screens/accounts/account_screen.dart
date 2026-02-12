import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinterest_clone_app/domain/services/session_service.dart';
import 'package:pinterest_clone_app/presentation/utils/snackbar_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

    Future<void> _logout(BuildContext context) async {
    final auth = ClerkAuth.of(context);
    await auth.signOut(); 

    await SessionService.clear();

    AppSnackbar.success(context, "Logged out successfully");
   context.go('/'); 
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.22),
                  const Text(
                    "Your account",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.03),


              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1C),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.blue,
                          child: Text(
                            "B",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "user",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),


                    Row(
                      children: [
                        Expanded(child: _blackButton("View profile", context)),
                        const SizedBox(width: 12),
                        Expanded(child: _blackButton("Share profile", context)),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.04),

              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: size.height * 0.02),


              ...this.settingsTiles(context),
            ],
          ),
        ),
      ),
    );
  }


  static Widget _blackButton(String text , BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/profile'),
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  List<Widget> settingsTiles(BuildContext context) {
    final items = {
      "Account management": () {},
      "Profile visibility": () {},
      "Refine your recommendations": () {},
      "Claimed external accounts": () {},
      "Social permissions": () {},
      "Notifications": () {},
      "Privacy and data": () {},
      "Reports and violations centre": () {},
      "Login": () => context.push('/auth'),
      "Add account": () {},
      "Security": () {},
      "Log out": () => _logout(context),
      "Support": () {},
      "Help Centre": () {},
      "Terms of Service": () {},
      "Privacy Policy": () {},
       "About": () {},
    };

    return items.entries
        .expand((e) => [SettingsTile(title: e.key, onTap: e.value)])
        .toList();
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingsTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Icon(Icons.chevron_right, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
