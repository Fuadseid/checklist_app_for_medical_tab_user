class Model {
  late List<List<dynamic>> dates;
  
  Model() {
    dates = List.generate(10, (index) {
      DateTime date = DateTime.now().subtract(Duration(days: index));
      return [
        date.day,
        date.month,
        date.year,
        false, // bvalue for the day
        false, // bvalue1 for the day
      ];
    });
  }

  // Method to update bvalue for a specific date
  void updateBValue(DateTime date, bool value) {
    int index = _getDateIndex(date);
    if (index != -1) {
      dates[index][3] = value; // Update bvalue
    }
  }

  // Method to update bvalue1 for a specific date
  void updateBValue1(DateTime date, bool value) {
    int index = _getDateIndex(date);
    if (index != -1) {
      dates[index][4] = value; // Update bvalue1
    }
  }

  // Helper method to find the index of a specific date in the list
  int _getDateIndex(DateTime date) {
    for (int i = 0; i < dates.length; i++) {
      DateTime dateInList = DateTime(dates[i][2], dates[i][1], dates[i][0]);
      if (dateInList.isAtSameMomentAs(date)) {
        return i;
      }
    }
    return -1;
  }
}
