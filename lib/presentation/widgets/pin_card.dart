import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'shimmer_box.dart';
import 'pin_options_sheet.dart';

class PinCard extends StatelessWidget {
  final String imageUrl;
  const PinCard({super.key, required this.imageUrl});

  double _getAspectRatio() {
    final parts = imageUrl.split('/');
    final width = double.parse(parts[parts.length - 2]);
    final height = double.parse(parts.last);
    return width / height;
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = _getAspectRatio();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () =>
  context.push(
    '/viewer',
    extra: imageUrl,
  ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (_, __) => const ShimmerBox(),
                errorWidget: (_, __, ___) =>
                    const Icon(Icons.error),
              ),
            ),
          ),
        ),

        const SizedBox(height: 6),

        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (_) => PinOptionsSheet(imageUrl: imageUrl),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.more_horiz, color: Colors.white, size: 22),
          ),
        ),
      ],
    );
  }
}
