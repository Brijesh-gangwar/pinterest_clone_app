import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone_app/presentation/widgets/pin_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}


class _HomeTabState extends State<HomeTab> {


  @override
  Widget build(BuildContext context) {
    final images = [
      'https://picsum.photos/400/600',
      'https://picsum.photos/400/500',
      'https://picsum.photos/400/700',
      'https://picsum.photos/400/550',
      'https://picsum.photos/400/650',
      'https://picsum.photos/400/520',
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "For you",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ), 
                Container(
                  height: 1,
                  width: 70, 
                  color: Colors.white,
                ),
              ],
            ),

            actions: [
              Container(
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined, size: 28),
                ),
              ),
            ],
          ),

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return PinCard(imageUrl: images[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
