import 'package:flutter/foundation.dart';

/// A single flashcard (question–answer)
class Flashcard {
  final String question;
  final String answer;

  Flashcard({
    required this.question,
    required this.answer,
  });
}

/// A topic that owns many flashcards
class FlashcardTopic {
  final String id;
  final String title;
  final List<Flashcard> flashcards;

  FlashcardTopic({
    required this.id,
    required this.title,
    required this.flashcards,
  });
}

/// In-memory store (temporary until we use a database)
final List<FlashcardTopic> flashcardTopics = [
  FlashcardTopic(
    id: 'flutter',
    title: 'Flutter',
    flashcards: [
      Flashcard(
          question: 'What is Flutter?', answer: 'A UI toolkit by Google.'),
      Flashcard(
          question: 'What is a Widget?',
          answer: 'Basic building block of UI in Flutter.'),
    ],
  ),
  FlashcardTopic(
    id: 'dart',
    title: 'Dart',
    flashcards: [
      Flashcard(
          question: 'What is Dart?', answer: 'The language used by Flutter.'),
    ],
  ),
];

/// Add a topic if it doesn't exist already
bool addTopicIfNotExists(String title) {
  final exists = flashcardTopics.any(
    (t) => t.title.toLowerCase() == title.trim().toLowerCase(),
  );
  if (exists) return false;

  flashcardTopics.add(
    FlashcardTopic(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title.trim(),
      flashcards: [],
    ),
  );
  return true;
}

/// Find a topic by its ID
FlashcardTopic? findTopicById(String id) {
  try {
    return flashcardTopics.firstWhere((t) => t.id == id);
  } catch (_) {
    return null;
  }
}

/// Add a flashcard to a specific topic
bool addFlashcardToTopic({
  required String topicId,
  required Flashcard card,
}) {
  final topic = findTopicById(topicId);
  if (topic == null) return false;
  topic.flashcards.add(card);
  return true;
}
