// lib/pages/topic_flashcards_page.dart
import 'package:flutter/material.dart';
import '../data/flashcard_data.dart';

class TopicFlashcardsPage extends StatelessWidget {
  final FlashcardTopic topic;
  const TopicFlashcardsPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(topic.title)),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: topic.cards.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final card = topic.cards[index];
          return ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.black12),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.black12),
            ),
            title: Text(
              card.question,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(card.answer),
              )
            ],
          );
        },
      ),
    );
  }
}
