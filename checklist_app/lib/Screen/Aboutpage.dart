import 'package:flutter/material.dart';

class Aboutpage extends StatefulWidget {
  const Aboutpage({super.key});

  @override
  State<Aboutpage> createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/aboutme.jpg',
                    height: 300,
                    width: 200,
                  ),
                 const Text("About This App", style: TextStyle(fontSize: 20)),
                  const Text(
                      "Hello, my name is Fuad Seid, and I am a full-stack web developer specializing in React and Node.js, as well as a mobile app developer using Flutter. I developed this app to solve a personal challenge. At the time, my mother was struggling with diabetes and often forgot to take her medication. To address this, I created this app as a simple and effective solution to help her stay on track with her health. Today, I am proud to share this app with you all. It is no longer just for my mom, but for anyone who needs assistance in managing their medication schedules. My goal is to make it easier for people to remember their daily doses and improve their overall well-being.")
                ],
              )),
        ],
      ),
    );
  }
}
