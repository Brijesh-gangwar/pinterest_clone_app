import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/helper/format_date.dart';
import '../../domain/models/user_details_model.dart';
import '../../domain/notifiers/user_notifier.dart.dart';

class ViewProfileWidget extends ConsumerWidget {
  const ViewProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

  
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: user == null
          ? const Center(
              child: Text(
                "No profile found",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade800,
                    child: Text(
                      user.gender.isNotEmpty
                          ? user.gender[0].toUpperCase()
                          : "U",
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // User ID
                  _buildLabelValue("User ID", user.userId),

                  const SizedBox(height: 30),

                  // Info Card
                  _buildInfoCard(user),

                  const SizedBox(height: 30),

                  // Interests
                  _buildInterestSection(user),
                ],
              ),
            ),
    );
  }

  Widget _buildLabelValue(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value.isNotEmpty ? value : "-",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(UserDetailsModel user) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildRow("Date of Birth",
              user.age.isNotEmpty ? formatDate(user.age) : "-"),
          const Divider(color: Colors.white12),
          _buildRow("Gender", user.gender.isNotEmpty ? user.gender : "-"),
          const Divider(color: Colors.white12),
          _buildRow("Region", user.region.isNotEmpty ? user.region : "-"),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterestSection(UserDetailsModel user) {
    if (user.interests.isEmpty) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Interests",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: user.interests.map((interest) {
            return Chip(
              label: Text(
                interest,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red.shade700,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            );
          }).toList(),
        ),
      ],
    );
  }
}


