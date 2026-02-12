import 'package:flutter/material.dart';

class BaseAuthLayout extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const BaseAuthLayout({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.08),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.height * 0.035,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
