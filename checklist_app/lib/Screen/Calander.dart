import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:checklist_app/Screen/Checker.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? _selectedDay;
  DateTime today = DateTime.now();
  bool newvalue = false; // Persistent state for checkbox

  final morningStart = TimeOfDay(hour: 6, minute: 0);
  final morningEnd = TimeOfDay(hour: 8, minute: 0);
  final eveningStart = TimeOfDay(hour: 20, minute: 0);
  final eveningEnd = TimeOfDay(hour: 22, minute: 0);

  bool isWithinTimeRange(TimeOfDay start, TimeOfDay end) {
    final nowMinutes = today.hour * 60 + today.minute;
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;

    return nowMinutes >= startMinutes && nowMinutes <= endMinutes;
  }

  bool isSameDay(DateTime? day1, DateTime? day2) {
    if (day1 == null || day2 == null) return false;
    return day1.year == day2.year &&
        day1.month == day2.month &&
        day1.day == day2.day;
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });

    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          // Use StatefulBuilder to manage state within the modal
          builder: (context, setModalState) {
            return FractionallySizedBox(
              heightFactor: 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(100, 43, 43, 43),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        (_selectedDay?.day.toString()) ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Checker(
                          value: newvalue,
                          onChanged: (bool? value) {
                            if (today.hour > morningStart.hour &&
                                today.hour < morningEnd.hour) {
                              setModalState(() {
                                newvalue = value ?? false;
                              });
                            } else {
                              setModalState(() {
                                newvalue = false;
                              });
                            }
                          },
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Morening ",
                          style: TextStyle(fontSize: 30),
                        ),
                      ]),),
                       const  SizedBox(
                          height: 20,
                        ),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: Row(  
                     children: [
                        Checker(
                          value: newvalue,
                          onChanged: (bool? value) {
                            if (today.hour > eveningStart.hour &&
                                today.hour < eveningEnd.hour) {
                              setModalState(() {
                                newvalue = value ?? false;
                              });
                            } else {
                              setModalState(() {
                                newvalue = false;
                              });
                            }
           
                          },
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Evening ",
                          style: TextStyle(fontSize: 30),
                        )
                      ],
                    ),
                  ),
                    ])
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TableCalendar(
        firstDay: DateTime.utc(2024, 12, 20),
        focusedDay: today,
        lastDay: DateTime.utc(2050, 3, 14),
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: onDaySelected,
      ),
    );
  }
}
