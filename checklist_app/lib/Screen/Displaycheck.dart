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
    final now = [DateTime.now().day, DateTime.now().month, DateTime.now().year];
    return Consumer<Checkerprovider>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 12, 75, 47)),
          color: const Color.fromARGB(255, 39, 43, 44),
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
                  border:
                      Border.all(color: const Color.fromARGB(255, 2, 20, 12)),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 23, 33, 35),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        '${now[0].toString()}/${now[1].toString()}/${now[2].toString()}', // Display bvalue from Checkerprovider
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: bvalue == true
                                      ? const Color.fromARGB(255, 12, 75, 47)
                                      : const Color.fromARGB(225, 225, 0, 0),
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: bvalue == true
                                          ? const Color.fromARGB(
                                              255, 12, 75, 47)
                                          : const Color.fromARGB(
                                              255, 255, 0, 0)),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Morning",
                                style:  TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: bvalue1 == true
                                      ? const Color.fromARGB(255, 12, 75, 47)
                                      : const Color.fromARGB(225, 225, 0, 0),
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: bvalue1 == true
                                          ? const Color.fromARGB(
                                              255, 12, 75, 47)
                                          : const Color.fromARGB(
                                              255, 255, 0, 0)),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Evening", // Display bvalue1 from Checkerprovider
                                style:  TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
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
