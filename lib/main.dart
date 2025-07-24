import 'package:flutter/material.dart';
import 'package:studybuddy/pages/add_notes_page.dart';
import 'package:studybuddy/pages/flashcards_page.dart';
import 'package:studybuddy/pages/home_page.dart';
import 'package:studybuddy/pages/profile_page.dart';
import 'package:studybuddy/pages/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/page0/': (context) => HomePage(),
        '/page1/': (context) => AddNotesPage(),
        '/page2/': (context) => FlashcardsPage(),
        '/page3/': (context) => ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.purple.shade400,
        appBarTheme: AppBarTheme(color: const Color.fromARGB(0, 173, 65, 65)),
        scaffoldBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
      ),
      home: SplashScreen(),
    ),
  );
}
