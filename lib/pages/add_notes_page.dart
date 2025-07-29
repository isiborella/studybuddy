import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class AddNotesPage extends StatefulWidget {
  const AddNotesPage({super.key});

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  int currentIndex = 1; // Page index set to 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 228, 228),
        title: const Text(
          'Add Notes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 248, 119, 119),
        child: const Center(
          child: Text(
            'This is the Add Notes page.',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: const Color.fromARGB(255, 240, 228, 228),
        waterDropColor: Theme.of(context).primaryColor,
        barItems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined,
          ),
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
          setState(() {
            currentIndex = index;
          });
          Navigator.of(context).pushNamed('/page$currentIndex/');
        },
        selectedIndex: currentIndex,
      ),
    );
  }
}
