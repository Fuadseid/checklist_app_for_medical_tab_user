import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checklist_app/provider/Checkerprovider.dart';

class Displaycheck extends StatelessWidget {
  const Displaycheck({super.key});

  @override
  Widget build(BuildContext context) {
    // Access Checkerprovider values
    final bvalue = context.watch<Checkerprovider>().bvalue;
    final bvalue1 = context.watch<Checkerprovider>().bvalue1;

    return Consumer(
      builder: (context, value, child) => 
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 12, 75, 47)),
          color: const Color.fromARGB(255, 62, 66, 67),
        ),
        height: 350,
        width: 350,
        child: ListView.builder(
          itemCount: 2, // Example item count
          itemBuilder: (context, index) {
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
                      Radio(value: false, groupValue: context.read<Checkerprovider>().bvalue, onChanged: null),
                      Text(
                        bvalue.toString(), // Display bvalue from Checkerprovider
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        context.read<Checkerprovider>().bvalue.toString(), // Display bvalue1 from Checkerprovider
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
