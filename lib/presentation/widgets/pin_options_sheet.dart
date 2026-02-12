import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/presentation/widgets/shimmer_box.dart';

class PinOptionsSheet extends StatelessWidget {
  final String imageUrl;
  const PinOptionsSheet({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // MAIN SHEET
        Container(
          margin: const EdgeInsets.only(top: 80),
          padding: const EdgeInsets.fromLTRB(30, 20, 10, 10),
          decoration: const BoxDecoration(
            color: Color(0xFF1C1C1C),
            borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "This Pin is inspired by your recent activity",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),

              const SizedBox(height: 5),

              _tile(Icons.push_pin_outlined, "Save"),
              _tile(Icons.share_outlined, "Share"),
              _tile(Icons.download_outlined, "Download image"),
              _tile(Icons.favorite_border, "See more like this"),
              _tile(Icons.visibility_off_outlined, "See less like this"),
              _tile(
                Icons.report_outlined,
                "Report Pin",
                subtitle: "This goes against Pinterest's Community Guidelines",
              ),
            ],
          ),
        ),

        Positioned(
          top: 0,
          left: size.width * 0.32,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 150,
              width: 130,
              fit: BoxFit.cover,
              placeholder: (context, url) => const ShimmerBox(),
              errorWidget:
                  (context, url, error) => Container(
                    height: 150,
                    width: 130,
                    color: Colors.grey[800],
                    child: const Icon(Icons.error, color: Colors.white),
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _tile(IconData icon, String text, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
