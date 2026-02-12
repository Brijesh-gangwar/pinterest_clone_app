import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinterest_clone_app/presentation/widgets/progress_step.dart';

import '../../../domain/services/hive_service.dart';

class SignupInterestScreen extends StatefulWidget {
  const SignupInterestScreen({super.key});


  @override
  State<SignupInterestScreen> createState() => _SignupInterestScreenState();
}

class _SignupInterestScreenState extends State<SignupInterestScreen> {

  final Set<String> selectedInterests = {};


  final Map<String, String> interestData = {
    "Video game customisation": "https://images.unsplash.com/photo-1542751371-adc38448a05e?q=80&w=500",
    "Hair inspiration": "https://images.unsplash.com/photo-1560869713-7d0a29430803?q=80&w=500",
    "Weddings": "https://images.unsplash.com/photo-1511795409834-ef04bbd61622?q=80&w=500",
    "Phone wallpapers": "https://images.unsplash.com/photo-1550684848-fac1c5b4e853?q=80&w=500",

    "Baking": "https://images.unsplash.com/photo-1555507036-ab1f4038808a?q=80&w=500",
    "DIY projects": "https://images.unsplash.com/photo-1520390138845-fd2d229dd553?q=80&w=500",
 "Home renovation": "https://images.unsplash.com/photo-1517581177682-a085bb7ffb15?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
"Home décor": "https://plus.unsplash.com/premium_photo-1683129700193-d53e8ce58885?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGhvbWUlMjBkZWNvciUyMGZyZWV8ZW58MHx8MHx8fDA%3D",
    "Photography": "https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=500",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => context.pop(),
        ),

        title: StepIndicator(currentIndex: 5),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text("What are you in the mood to do?", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)), 
                SizedBox(height: 8),
                Text("Pick more to curate your experience", style: TextStyle(color: Colors.white70, fontSize: 16)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
              itemCount: interestData.length,
              itemBuilder: (context, index) {
                String title = interestData.keys.elementAt(index);
                String image = interestData.values.elementAt(index);
                bool isSelected = selectedInterests.contains(title); 

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedInterests.remove(title); 
                      } else {
                        selectedInterests.add(title); 
                      }
                    });
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(image, fit: BoxFit.cover, width: double.infinity),
                            ),

                            if (isSelected)
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 12,
                                    child: Icon(Icons.check, color: Colors.black, size: 18),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(title, style: const TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center, maxLines: 2), 
                    ],
                  ),
                );
              },
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: selectedInterests.isEmpty ? null : () async {
                await HiveService.saveInterests(selectedInterests.toList());
                context.go('/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              child: const Text("Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}