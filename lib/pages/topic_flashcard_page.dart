import 'package:flutter/material.dart';
import '../data/flashcard_data.dart';

class TopicFlashcardsPage extends StatefulWidget {
  final FlashcardTopic topic;

  const TopicFlashcardsPage({super.key, required this.topic});

  @override
  State<TopicFlashcardsPage> createState() => _TopicFlashcardsPageState();
}

class _TopicFlashcardsPageState extends State<TopicFlashcardsPage> {
  final _qCtrl = TextEditingController();
  final _aCtrl = TextEditingController();

  @override
  void dispose() {
    _qCtrl.dispose();
    _aCtrl.dispose();
    super.dispose();
  }

  /// Add a new flashcard to the topic
  void _addCard() async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Add Flashcard'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _qCtrl,
                decoration: const InputDecoration(hintText: 'Question'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _aCtrl,
                decoration: const InputDecoration(hintText: 'Answer'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _qCtrl.clear();
                _aCtrl.clear();
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final q = _qCtrl.text.trim();
                final a = _aCtrl.text.trim();
                if (q.isEmpty || a.isEmpty) return;

                setState(() {
                  widget.topic.flashcards.add(
                    Flashcard(question: q, answer: a),
                  );
                });

                _qCtrl.clear();
                _aCtrl.clear();
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cards = widget.topic.flashcards;

    return Scaffold(
      appBar: AppBar(title: Text(widget.topic.title)),
      body: cards.isEmpty
          ? const Center(child: Text('No flashcards yet. Add one!'))
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: cards.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final card = cards[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(
                      card.question,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(card.answer),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCard,
        child: const Icon(Icons.add),
      ),
    );
  }
}
