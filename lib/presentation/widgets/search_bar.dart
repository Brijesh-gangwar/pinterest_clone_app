import 'package:flutter/material.dart';

class PinterestSearchBar extends StatelessWidget {
  const PinterestSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white24),
        ),
        child: const Row(
          children: [
            Icon(Icons.search, color: Colors.white54),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Search for ideas",
                style: TextStyle(color: Colors.white54, fontSize: 16),
              ),
            ),
            Icon(Icons.camera_alt_outlined, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}
