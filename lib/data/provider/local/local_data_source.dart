import 'package:shared_preferences/shared_preferences.dart';

import '/core/constants/strings.dart';

class LocalDataSource {
  const LocalDataSource();

  Future<void> saveLastPrimeTime(DateTime time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(lastPrimeTimeString, time.millisecondsSinceEpoch);
  }

  Future<DateTime?> getLastPrimeTime() async {
    final prefs = await SharedPreferences.getInstance();
    final time = prefs.getInt(lastPrimeTimeString);

    if (time == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(time);
  }
}
