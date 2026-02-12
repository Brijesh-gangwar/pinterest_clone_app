import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SavedTab extends StatelessWidget {
  const SavedTab({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(

        appBar: AppBar(

          elevation: 0,
          leadingWidth: width * 0.18, 
          leading: GestureDetector(
            onTap: () => context.push('/saved/account'),
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.04),
              child: const Center(
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xFF5D78FF), 
                  child: Text(
                    "B", 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          title: const TopTabs(),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: width * 0.02),
            const SavedSearchBar(),
            SizedBox(height: width * 0.05),
            const Expanded(
              child: TabBarView(
                children: [
                  EmptyPinsView(),
                  EmptySavedView(), 
                  EmptySavedView(), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopTabs extends StatelessWidget {
  const TopTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      dividerColor: Colors.transparent, 
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label, 
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      tabs: [
        Tab(text: "Pins"),
        Tab(text: "Boards"),
        Tab(text: "Collages"),
      ],
    );
  }
}

class SavedSearchBar extends StatelessWidget {
  const SavedSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48, 
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[900], 
                borderRadius: BorderRadius.circular(12), 
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.white, size: 20),
                  SizedBox(width: 10),
                  Text(
                    "Search your Pins",
                    style: TextStyle(color: Colors.white54, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: width * 0.04),
          const Icon(Icons.add, color: Colors.white, size: 30),
        ],
      ),
    );
  }
}

class EmptyPinsView extends StatelessWidget {
  const EmptyPinsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CircleAvatar(
            radius: width * 0.25,
            backgroundColor: Colors.white10,
            child: const Icon(Icons.push_pin, size: 80, color: Colors.redAccent),
          ),
          SizedBox(height: width * 0.08),
          const Text(
            "Save what inspires you",
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: width * 0.03),
          const Text(
            "Saving Pins is Pinterest's superpower. Browse Pins, save what you love, find them here to get inspired all over again.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 15),
          ),
          SizedBox(height: width * 0.08),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            ),
            child: const Text(
              "Explore Pins",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}


class EmptySavedView extends StatelessWidget {
  const EmptySavedView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            width: size.height * 0.26,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF123B5A),
            ),
            child: ClipOval(
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/1828/1828884.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Save what inspires you",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              "Saving Pins is Pinterest’s superpower.\nBrowse Pins, save what you love, find them here to get inspired all over again.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white54, height: 1.6),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Explore Pins"),
            ),
          ),
        ],
      ),
    );
  }
}



class PinsView extends StatelessWidget {
  const PinsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptySavedView();
  }
}


class BoardsView extends StatelessWidget {
  const BoardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptySavedView();
  }
}




class CollagesView extends StatelessWidget {
  const CollagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptySavedView();
  }
}
