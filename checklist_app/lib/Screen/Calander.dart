import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calander extends StatefulWidget {
  const Calander({super.key});

  @override
  State<Calander> createState() => _CalanderState();
}

class _CalanderState extends State<Calander> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        child: TableCalendar(
          
          firstDay: DateTime.utc(2024, 12, 20),
          focusedDay: today,
          lastDay: DateTime.utc(2050, 3, 14),
        ),
      ),
    );
  }
}
