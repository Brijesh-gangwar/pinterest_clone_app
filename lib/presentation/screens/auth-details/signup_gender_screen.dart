import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/services/hive_service.dart';


class SignupGenderScreen extends StatelessWidget {
  const SignupGenderScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
        // Progress indicator (Step 5 of 7 active) [cite: 67, 68]
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(6, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 3 ? Colors.white : Colors.grey[700],
              ),
            );
          }),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              "What is your gender?", // [cite: 72]
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "This helps us find you more relevant content. We won't show it on your profile.", // [cite: 73]
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 40),
            
            // Gender Option Buttons [cite: 74, 75, 76]
            _buildGenderButton(context, "Female"),
            _buildGenderButton(context, "Male"),
            _buildGenderButton(context, "Specify another gender"),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderButton(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          
          onPressed: () async {
                  await HiveService.saveGender(label);
            context.push('/signup-country');
          } ,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF333333), 
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}