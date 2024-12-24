import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const Drawer(
        child: Column(
        children: [

        
        ] 
        ),
      ),
      appBar: AppBar(
        title:const Text("Check list app for tablet"),
      ),

    );
  }
}