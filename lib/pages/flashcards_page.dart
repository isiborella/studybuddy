import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../data/flashcard_data.dart';
import '../widgets/flashcard_widgets.dart';
import 'topic_flashcard_page.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  int currentIndex = 2;
  final TextEditingController _flashcardController = TextEditingController();

  @override
  void dispose() {
    _flashcardController.dispose();
    super.dispose();
  }

  /// Navigate with slide animation
  void _navigateToTopic(FlashcardTopic topic) {
    Navigator.of(context).push(
      slideRightRoute(
        TopicFlashcardsPage(topic: topic),
      ),
    );
  }

  /// Add new topic
  void _addFlashcard() {
    final text = _flashcardController.text.trim();
    if (text.isEmpty) return;

    final added = addTopicIfNotExists(text);
    if (!added) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Topic already exists!')),
      );
    }

    setState(() {
      _flashcardController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text("Flashcards"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 240, 228, 228)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            AddTopicRow(
              controller: _flashcardController,
              onAdd: _addFlashcard,
            ),
            const SizedBox(height: 15),
            Expanded(
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
                  return TopicCard(
                    topic: topic,
                    onTap: () => _navigateToTopic(topic),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: theme.colorScheme.surface, // Theme surface color
        waterDropColor: theme.primaryColor, // Theme primary color
        barItems: [
          BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
          BarItem(
            filledIcon: Icons.add_task,
            outlinedIcon: Icons.add_task_outlined,
          ),
          BarItem(
            filledIcon: Icons.style,
            outlinedIcon: Icons.style_outlined,
          ),
          BarItem(
            filledIcon: Icons.person_2,
            outlinedIcon: Icons.person_2_outlined,
          ),
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
