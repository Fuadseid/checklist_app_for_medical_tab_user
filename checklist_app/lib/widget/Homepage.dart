import 'package:flutter/material.dart';
import 'package:checklist_app/Screen/Calander.dart';
import 'package:checklist_app/Screen/Displaycheck.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
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
      body:const Column(
        children: [
          Calander(),
          Displaycheck(),
        ],
      ),
    );
  }
}
