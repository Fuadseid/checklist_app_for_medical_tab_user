import 'package:flutter/material.dart';
import 'package:checklist_app/Screen/Calander.dart';
import 'package:checklist_app/Screen/Displaycheck.dart';
import 'package:checklist_app/Screen/Aboutpage.dart';
import 'package:checklist_app/Screen/Search.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0; // Move index here to maintain state across rebuilds

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(22, 22, 27, 100),
        iconTheme: const IconThemeData(color: Colors.white, size: 35),
        title: Text(
          "Check list app for tablet",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              child: Image.asset(
                'assets/many_tablets.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              child: Text(
                "Home page",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                setState(() {
                  index = 0;
                });
                Navigator.pop(context); // Close the drawer after selecting
              },
            ),
            const SizedBox(height: 50),
            GestureDetector(
              child: Text(
                "Search Medicine",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                setState(() {
                  index = 1;
                });
                Navigator.pop(context); // Close the drawer after selecting
              },
            ),
            const SizedBox(height: 50),
            GestureDetector(
              child: Text(
                "About page",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                setState(() {
                  index = 2;
                });
                Navigator.pop(context); // Close the drawer after selecting
              },
            ),
          ],
        ),
      ),
      body: index == 0
          ?const Column(
              children:  [
                Expanded(
                  child: Column(
                    children: [
                      Calendar(),
                      SizedBox(height: 50),
                      Displaycheck(),
                    ],
                  ),
                ),
              ],
            )
          : index == 1
              ? const Search()
              : const Aboutpage(),
    );
  }
}
