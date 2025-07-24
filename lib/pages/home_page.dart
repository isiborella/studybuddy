import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 228, 228),
        centerTitle: true,
        title: const Text(
          'StudyBuddy',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 119, 119),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(
            //   child: Text(
            //     "Today's Reminder",
            //     style: TextStyle(color: Colors.black, fontSize: 25),
            //   ),
            // ),
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 150,
                    height: 200,
                    padding: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Algebra',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
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
