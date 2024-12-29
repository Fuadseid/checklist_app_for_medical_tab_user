import 'package:flutter/material.dart';
import 'package:checklist_app/Screen/Calander.dart';  // Assuming you have Calendar imported
import 'package:checklist_app/Screen/Displaycheck.dart';  // Correct import of Displaycheck

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
        child: const Column(children: []),
      ),
      body: const Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Calendar(),  // Ensure Calendar is imported correctly
              SizedBox(
                height: 50,
              ),
              Displaycheck(),  // Displaycheck is used here
            ],
          ))
        ],
      ),
    );
  }
}
