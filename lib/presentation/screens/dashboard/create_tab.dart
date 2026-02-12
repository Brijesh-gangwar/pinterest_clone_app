import 'package:flutter/material.dart';

class CreateBottomSheet extends StatelessWidget {
  const CreateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.31,
      decoration: const BoxDecoration(
        color: Color(0xFF2B2B2B),
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),

          Row(
            children: [
              SizedBox(width: size.width * 0.02),

              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 34),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(width: size.width * 0.15),

              const Text(
                "Start creating now",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          SizedBox(height: size.height * 0.05),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _CreateOption(icon: Icons.push_pin, label: "Pin"),
              _CreateOption(icon: Icons.content_cut, label: "Collage"),
              _CreateOption(icon: Icons.dashboard_outlined, label: "Board"),
            ],
          ),
        ],
      ),
    );
  }
}

class _CreateOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CreateOption({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: w * 0.18,
          width: w * 0.18,
          decoration: BoxDecoration(
            color: const Color(0xFF3A3A3A),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        SizedBox(height: w * 0.03),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
