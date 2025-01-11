import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:checklist_app/Screen/Checker.dart';
import 'package:checklist_app/model/Model.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final model = Model();
  late bool bevalue;
  late bool bevalue1;

  @override
  void initState() {
    super.initState();
    // Initialize the checkboxes based on model values
    bevalue = model.dates[0][3];
    bevalue1 = model.dates[0][4];
  }

  DateTime? _selectedDay;
  DateTime today = DateTime.now();
  final morningStart = const TimeOfDay(hour: 6, minute: 0);
  final morningEnd = const TimeOfDay(hour: 24, minute: 0);
  final eveningStart = const TimeOfDay(hour: 20, minute: 0);
  final eveningEnd = const TimeOfDay(hour: 24, minute: 0);

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

  int _getDateIndex(DateTime date) {
    for (int i = 0; i < model.dates.length; i++) {
      DateTime dateInList = DateTime(model.dates[i][2], model.dates[i][1], model.dates[i][0]);
      if (dateInList.isAtSameMomentAs(date)) {
        return i;
      }
    }
    return -1;
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });

    DateTime todaymidnight = DateTime(today.year, today.month, today.day);
    DateTime selectedDaymidnight =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
    if (todaymidnight == selectedDaymidnight) {
      showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
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
                                value: model.dates[_getDateIndex(selectedDay)][3], // Use dynamic value based on selected day
                                onChanged: (bool? value) {
                                  if (isWithinTimeRange(morningStart, morningEnd)) {
                                    if (value == true) {
                                      // Show the AlertDialog when checkbox is checked
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
                                                  setState(() {
                                                    model.dates[_getDateIndex(selectedDay)][3] = false; // Update model
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'No',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                              // "Yes" button
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    model.dates[_getDateIndex(selectedDay)][3] = true; // Update model
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  } else {
                                    setState(() {
                                      model.dates[_getDateIndex(selectedDay)][3] = false; // Update model
                                    });
                                  }
                                },
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "Morning",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Checker(
                                value: model.dates[_getDateIndex(selectedDay)][4], // Use dynamic value based on selected day
                                onChanged: (bool? value) {
                                  if (isWithinTimeRange(eveningStart, eveningEnd)) {
                                    if (value == true) {
                                      // Show the AlertDialog when checkbox is checked
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Alert'),
                                            content: const Text(
                                              'Are you taking the medicine in the evening?',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                            actions: <Widget>[
                                              // "No" button
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    model.dates[_getDateIndex(selectedDay)][4] = false; // Update model
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'No',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                              // "Yes" button
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    model.dates[_getDateIndex(selectedDay)][4] = true; // Update model
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  } else {
                                    setState(() {
                                      model.dates[_getDateIndex(selectedDay)][4] = false; // Update model
                                    });
                                  }
                                },
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "Evening",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 23, 72, 82),
                                padding: const EdgeInsets.all(20)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Close",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }
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
