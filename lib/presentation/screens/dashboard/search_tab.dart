
import 'package:flutter/material.dart';

import '../../widgets/banner_carousel.dart';
import '../../widgets/carousel_dots.dart';
import '../../widgets/horizontal_boards.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/section_header.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              const PinterestSearchBar(),
              const SizedBox(height: 18),

              BannerCarousel(height: size.height * 0.38),
              const SizedBox(height: 12),

              const CarouselDots(activeIndex: 1),
              const SizedBox(height: 18),

              const SectionHeader(
                small: "Explore featured boards",
                title: "Ideas you might like",
              ),

              const SizedBox(height: 14),

              HorizontalBoards(
                height: size.height * 0.22,
                width: size.width * 0.55,
              ),
            ],
          ),
        ),
      ),
    );
  }
}