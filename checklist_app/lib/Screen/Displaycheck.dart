import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checklist_app/provider/Checkerprovider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Displaycheck extends StatelessWidget {
  const Displaycheck({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch the `Checkerprovider` for changes
    final checkerProvider = context.watch<Checkerprovider>();
    final model = checkerProvider.model; // Access model from the provider

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
          itemCount: model.dates.length, // Use the length of `dates`
          itemBuilder: (context, index) {
            final date = model.dates[index];
            final mornchecked = date[3] as bool;  // Today's morning checkbox
            final evechecked = date[4] as bool;   // Today's evening checkbox
            int day = date[0];
            int month = date[1];
            int year = date[2];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 2, 20, 12)),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 23, 33, 35),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          '$day/$month/$year',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatusIndicator("Morning", mornchecked),
                          _buildStatusIndicator("Evening", evechecked),
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

  // Helper widget for status indicators
  Widget _buildStatusIndicator(String label, bool status) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: status
                ? const Color.fromARGB(255, 12, 75, 47) // Green if true
                : const Color.fromARGB(225, 225, 0, 0), // Red if false
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: status
                  ? const Color.fromARGB(255, 12, 75, 47) // Green border if true
                  : const Color.fromARGB(255, 255, 0, 0), // Red border if false
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
