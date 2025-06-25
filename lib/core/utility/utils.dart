import 'package:intl/intl.dart';

// to get week number of a year I borrowed the logic from link below and customize it in my way:
//  https://stackoverflow.com/a/59693145/13234584
int getIsoWeekNumber(DateTime date) {
  final thursday = date.subtract(Duration(days: date.weekday - 4));
  final firstThursday = DateTime(thursday.year, 1, 4);
  final firstWeekStart = firstThursday.subtract(
    Duration(days: firstThursday.weekday - 1),
  );

  return ((thursday.difference(firstWeekStart).inDays) ~/ 7) + 1;
}

String formattedTime(DateTime time) {
  return DateFormat("HH:mm").format(time);
}

String formattedDate(DateTime time) {
  return DateFormat("EE d. MMM.", "de_DE").format(time);
}

// to check the number is prime or not, I borrowed the logic they provided in this link:
//  https://medium.com/@milankathiriya/a-dart-program-to-find-if-a-given-number-is-palindrome-or-not-4c55c9f48310
bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }

  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}

// to format duration between now and last time into HH:mm:ss I used this formatter that
// provided in the link below:
//  https://stackoverflow.com/a/57313703/13234584
String formatDuration(Duration duration) {
  return [
    duration.inHours,
    duration.inMinutes.remainder(60),
    duration.inSeconds.remainder(60),
  ].map((seg) => seg.toString().padLeft(2, '0')).join(':');
}
