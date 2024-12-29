import 'package:flutter/material.dart';
import 'package:checklist_app/provider/checkerprovider.dart';
import 'package:provider/provider.dart';

class Displaycheck extends StatefulWidget {
  const Displaycheck({super.key});

  @override
  State<Displaycheck> createState() => _DisplaycheckState();
}

class _DisplaycheckState extends State<Displaycheck> {

  
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> timeLabels = [
      {
        'label': 'Morning',
        'timeRange': 'Afternoon',
        'bvalue': context.watch<Checkerprovider>().bvalue,
        'bvalue1': context.watch<Checkerprovider>().bvalue1,
      },
      {'label': 'Morning', 'timeRange': 'Afternoon'},
    ];

   return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(255, 12, 75, 47)),
        color: const Color.fromARGB(255, 62, 66, 67),
      ),
      height: 350,
      width: 350,
      child: ListView.builder(
        itemCount: timeLabels.length,
        itemBuilder: (context, index) {
          String timerangemorning = timeLabels[index].values.elementAt(0);
          String timerangeevening = timeLabels[index].values.elementAt(1);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 12, 75, 47)),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 43, 64, 69),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      timerangemorning,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      timerangeevening,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
