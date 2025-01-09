import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checklist_app/provider/Checkerprovider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:checklist_app/Screen/Checker.dart';
import 'package:checklist_app/model/Model.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final checkedmodel = Model();
  late final mornchecked;
  late final evechecked;

  @override
  void initState() {
    super.initState();
    mornchecked = checkedmodel.dates[4];
    evechecked = checkedmodel.dates[5];
  }

  DateTime? _selectedDay;
  DateTime today = DateTime.now();
  bool newvalue = false; // Persistent state for checkbox
  bool newvalue1 = false; // Persistent state for checkbox
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
                    Consumer<Checkerprovider>(
                      builder: (_, model, child) => Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            Checker(
                              value: model.bvalue,
                              onChanged: (bool? value) {
                                if (isWithinTimeRange(
                                    morningStart, morningEnd)) {
                                  if (model.bvalue == false) {
                                    // Show the AlertDialog
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Alert'),
                                          content: const Text(
                                            'Are you taking the medicine in the morning?',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          actions: <Widget>[
                                            // "No" button
                                            TextButton(
                                              onPressed: () {
                                                // Do not check the checkbox
                                                model.toggleBvalue = false;
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
                                                model.toggleBvalue = true;
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
                                  model.toggleBvalue = false;
                                }
                              },
                            ),
                            const SizedBox(width: 20),
                            const Text(
                              "Morening ",
                              style: TextStyle(fontSize: 20),
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
                                value: model.bvalue1,
                                onChanged: (bool? value) {
                                  if (isWithinTimeRange(
                                      eveningStart, eveningEnd)) {
                                    if (model.bvalue1 == false) {
                                      // Show the AlertDialog
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Alert'),
                                            content: const Text(
                                              'Are you taking the medicine in the evening?',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            actions: <Widget>[
                                              // "No" button
                                              TextButton(
                                                onPressed: () {
                                                  // Do not check the checkbox
                                                  model.toggleBvalue1 = false;
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
                                                  model.toggleBvalue1 = true;
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
                                    model.toggleBvalue1 = false;
                                  }
                                },
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "Evening ",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
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
                      ]), 
                    )
                  ],
                ),
              );
            },
          );
        },
      );
    } else {
      return;
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
