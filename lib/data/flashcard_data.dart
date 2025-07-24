// lib/data/flashcard_data.dart

class Flashcard {
  final String question;
  final String answer;

  Flashcard({required this.question, required this.answer});
}

class FlashcardTopic {
  final String id;
  final String title;
  final List<Flashcard> cards;

  FlashcardTopic({
    required this.id,
    required this.title,
    required this.cards,
  });
}

final List<FlashcardTopic> flashcardTopics = [
  FlashcardTopic(
    id: 'flutter',
    title: 'Flutter',
    cards: [
      Flashcard(
          question: 'What is Flutter?', answer: 'A UI toolkit by Google.'),
      Flashcard(
          question: 'Hot reload vs hot restart?',
          answer: 'Hot reload keeps state, restart doesn’t.'),
    ],
  ),
  FlashcardTopic(
    id: 'dart',
    title: 'Dart',
    cards: [
      Flashcard(
          question: 'What is Dart?', answer: 'The language used by Flutter.'),
      Flashcard(
          question: 'Sound null safety?',
          answer: 'Compile-time null safety guarantees.'),
    ],
  ),
  FlashcardTopic(
    id: 'widgets',
    title: 'Widgets',
    cards: [
      Flashcard(
          question: 'Stateless vs Stateful?',
          answer: 'Stateless has no mutable state; Stateful does.'),
    ],
  ),
];
