import 'package:flutter/material.dart';

class Displaycheck extends StatefulWidget {
  const Displaycheck({super.key});

  @override
  State<Displaycheck> createState() => _DisplaycheckState();
}

class _DisplaycheckState extends State<Displaycheck> {
  final double itemExtent = 70.0; // Adjusted height for each item

  final List<Map<String, String>> timeLabels = [
    {'Morning': 'Afternoon'},
    {'Morning': 'Afternoon'},
    {'Morning': 'Afternoon'},
    {'Morning': 'Afternoon'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(255, 12, 75, 47)),
        color: const Color.fromARGB(255, 62, 66, 67),
      ),
      height: 350,
      width: 350,
      child: ListWheelScrollView(
        itemExtent: itemExtent,
        physics: const FixedExtentScrollPhysics(),
        children: timeLabels.map((entry) {
          String label = entry.keys.first;
          String timeRange = entry.values.first;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 12, 75, 47)),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 43, 64, 69),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      timeRange,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
