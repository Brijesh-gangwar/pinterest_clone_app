
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'shimmer_box.dart';

class HorizontalBoards extends StatelessWidget {
  final double height;
  final double width;

  const HorizontalBoards({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        padding: const EdgeInsets.only(left: 16),
        itemBuilder: (context, index) {
          final imageUrl = "https://picsum.photos/600/600?board=$index";

          return GestureDetector(
                        onTap: () => context.pushNamed('viewer', extra: imageUrl),
            child: Container(
              width: width,
              margin: const EdgeInsets.only(right: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => const ShimmerBox(),
                      ),
                    ),
                  ),
            
                  const SizedBox(height: 8),
            
                  const Text(
                    "Heisei vibes to try",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Aesthetics ✓",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
