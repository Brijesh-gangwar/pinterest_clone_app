import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinterest_clone_app/presentation/widgets/progress_step.dart';

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

        title: StepIndicator(currentIndex: 4),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              "What is your gender?", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "This helps us find you more relevant content. We won't show it on your profile.", 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 40),
            

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