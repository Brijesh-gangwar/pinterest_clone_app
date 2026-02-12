import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/services/hive_service.dart';

class CountryRegionSelectionScreen extends StatefulWidget {
  const CountryRegionSelectionScreen({super.key});

  @override
  State<CountryRegionSelectionScreen> createState() => _CountryRegionSelectionScreenState();
}

class _CountryRegionSelectionScreenState extends State<CountryRegionSelectionScreen> {
  // Base country is fixed as India 
  String selectedRegion = "Select your State/Region"; 


  final List<String> indianRegions = [
    "Andhra Pradesh", "Bihar", "Delhi", "Gujarat", "Karnataka", 
    "Maharashtra", "Punjab", "Tamil Nadu", "Uttar Pradesh", "West Bengal"
  ];

  void _showRegionPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return ListView.builder(
          itemCount: indianRegions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(indianRegions[index], style: const TextStyle(color: Colors.white)),
              onTap: () {
                setState(() => selectedRegion = indianRegions[index]);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

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

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(6, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8, height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 4 ? Colors.white : Colors.grey[700],
              ),
            );
          }),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "What is your state or region?", // 
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  "This helps us find you more relevant content. We won't show it on your profile.", 
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.4),
                ),
                const SizedBox(height: 40),
                
          

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(selectedRegion, style: const TextStyle(color: Colors.white, fontSize: 18)),
                  trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  onTap: _showRegionPicker,
                ),
              ],
            ),
          ),
          
 
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: selectedRegion.contains("Select") ? null : () async {
                          await HiveService.saveRegion(selectedRegion);
                          context.push('/signup-interest');
                  }, 

                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    disabledBackgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("Next", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}