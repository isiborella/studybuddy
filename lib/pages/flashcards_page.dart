import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../data/flashcard_data.dart';
import 'package:studybuddy/pages/topic_flashcard_page.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});
  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  int currentIndex = 2;

  // Custom slide transition
  Route _createRoute(FlashcardTopic topic) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          TopicFlashcardsPage(topic: topic),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide in from right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flashcards")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          itemCount: flashcardTopics.length,
          itemBuilder: (context, index) {
            final topic = flashcardTopics[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(_createRoute(topic));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    topic.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: const Color.fromARGB(255, 240, 228, 228),
        waterDropColor: Theme.of(context).primaryColor,
        barItems: [
          BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
          BarItem(
              filledIcon: Icons.add_task,
              outlinedIcon: Icons.add_task_outlined),
          BarItem(filledIcon: Icons.style, outlinedIcon: Icons.style_outlined),
          BarItem(
              filledIcon: Icons.person_2,
              outlinedIcon: Icons.person_2_outlined),
        ],
        onItemSelected: (index) {
          setState(() => currentIndex = index);
          Navigator.of(context).pushNamed('/page$currentIndex/');
        },
        selectedIndex: currentIndex,
      ),
    );
  }
}
