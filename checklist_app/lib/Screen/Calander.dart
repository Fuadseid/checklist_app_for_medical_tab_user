import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checklist_app/provider/checkerprovider.dart';
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
  bool newvalue1 = false; // Persistent state for checkbox
  final morningStart = const TimeOfDay(hour: 6, minute: 0);
  final morningEnd = const TimeOfDay(hour: 20, minute: 0);
  final eveningStart = const TimeOfDay(hour: 20, minute: 0);
  final eveningEnd = const TimeOfDay(hour: 22, minute: 0);

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
                  Consumer(
                    builder: (context, value, child) => Column(
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Checker(
                            value: newvalue,
                            onChanged: (bool? value) {
                              if (isWithinTimeRange(morningStart, morningEnd)) {
                                if (newvalue == false) {
                                  // Show the AlertDialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Alert'),
                                        content: const Text(
                                          'Are you taking the medicine in the morning?',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        actions: <Widget>[
                                          // "No" button
                                          TextButton(
                                            onPressed: () {
                                              // Do not check the checkbox
                                              setModalState(() {
                                                newvalue = false;
                                               
                                              });
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                            child: const Text(
                                              'No',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          // "Yes" button
                                          TextButton(
                                            onPressed: () {
                                              // Check the checkbox
                                              setModalState(() {
                                                newvalue = true;
                                              
                                              });
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                            child: const Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                // If outside the time range, uncheck the checkbox
                                setModalState(() {
                                  newvalue = false;
                                  context.read<Checkerprovider>().toggleBvalue =
                                      newvalue;
                                });
                              }
                            },
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            "Morening ",
                            style: TextStyle(fontSize: 30),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checker(
                              value: newvalue1,
                              onChanged: (bool? value) {
                                if (isWithinTimeRange(
                                    eveningStart, eveningEnd)) {
                                  if (newvalue1 == false) {
                                    // Show the AlertDialog
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Alert'),
                                          content: const Text(
                                            'Are you taking the medicine in the evening?',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          actions: <Widget>[
                                            // "No" button
                                            TextButton(
                                              onPressed: () {
                                                // Do not check the checkbox
                                                setModalState(() {
                                                  newvalue1 = false;
                                                  context
                                                      .read<Checkerprovider>()
                                                      .toggleBvalue1 = newvalue1;
                                                });
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                              },
                                              child: const Text(
                                                'No',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            // "Yes" button
                                            TextButton(
                                              onPressed: () {
                                                // Check the checkbox
                                                setModalState(() {
                                                  newvalue1 = true;
                                                  context
                                                      .read<Checkerprovider>()
                                                      .toggleBvalue1 = newvalue1;
                                                });
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                              },
                                              child: const Text(
                                                'Yes',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  // If outside the time range, uncheck the checkbox
                                  setModalState(() {
                                    newvalue1 = false;
                                    context
                                        .read<Checkerprovider>()
                                        .toggleBvalue1 = newvalue1;
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
                    ]),
                  )
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
