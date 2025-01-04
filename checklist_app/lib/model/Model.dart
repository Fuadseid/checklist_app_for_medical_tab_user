class Model {
  late List<List<dynamic>> dates;
  List<bool> bvalue = List<bool>.filled(10, false, growable: false); // Fixed size
  List<bool> bvalue1 = List<bool>.filled(10, false, growable: false); // Fixed size

  Model() {
    dates = [
      [DateTime.now().day, DateTime.now().month, DateTime.now().year, bvalue[0], bvalue1[0]],
      [DateTime.now().subtract(Duration(days: 1)).day, DateTime.now().subtract(Duration(days: 1)).month, DateTime.now().subtract(Duration(days: 1)).year, bvalue[1], bvalue1[1]],
      [DateTime.now().subtract(Duration(days: 2)).day, DateTime.now().subtract(Duration(days: 2)).month, DateTime.now().subtract(Duration(days: 2)).year, bvalue[2], bvalue1[2]],
      [DateTime.now().subtract(Duration(days: 3)).day, DateTime.now().subtract(Duration(days: 3)).month, DateTime.now().subtract(Duration(days: 3)).year, bvalue[3], bvalue1[3]],
      [DateTime.now().subtract(Duration(days: 4)).day, DateTime.now().subtract(Duration(days: 4)).month, DateTime.now().subtract(Duration(days: 4)).year, bvalue[4], bvalue1[4]],
      [DateTime.now().subtract(Duration(days: 5)).day, DateTime.now().subtract(Duration(days: 5)).month, DateTime.now().subtract(Duration(days: 5)).year, bvalue[5], bvalue1[5]],
      [DateTime.now().subtract(Duration(days: 6)).day, DateTime.now().subtract(Duration(days: 6)).month, DateTime.now().subtract(Duration(days: 6)).year, bvalue[6], bvalue1[6]],
      [DateTime.now().subtract(Duration(days: 7)).day, DateTime.now().subtract(Duration(days: 7)).month, DateTime.now().subtract(Duration(days: 7)).year, bvalue[7], bvalue1[7]],
      [DateTime.now().subtract(Duration(days: 8)).day, DateTime.now().subtract(Duration(days: 8)).month, DateTime.now().subtract(Duration(days: 8)).year, bvalue[8], bvalue1[8]],
      [DateTime.now().subtract(Duration(days: 9)).day, DateTime.now().subtract(Duration(days: 9)).month, DateTime.now().subtract(Duration(days: 9)).year, bvalue[9], bvalue1[9]],
    ];
  }

  // Method to update the dates based on the current bvalue and bvalue1
  void updateDates(int index) {
    dates[index][3] = bvalue[index]; // Update bvalue
    dates[index][4] = bvalue1[index]; // Update bvalue1
  }
}
