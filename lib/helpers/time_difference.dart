import 'package:intl/intl.dart';

String timeDifference(String date , String format) {
  
  DateFormat dateFormat = DateFormat(format);
  DateTime time = dateFormat.parse(date);

  DateTime now = DateTime.now();
  Duration difference = now.difference(time);

  int days = difference.inDays;
  int weeks = days ~/ 7;
  int hours = difference.inHours % 24;
  int minutes = difference.inMinutes % 60;
  int seconds = difference.inSeconds % 60;

  String formattedTime;
  if (weeks > 0) {
    formattedTime = '${weeks} weeks ago';
  } else if (days > 0) {
    formattedTime = '${days} days ago';
  } else if (hours > 0) {
    formattedTime = '${hours} hours ago';
  } else if (minutes > 0) {
    formattedTime = '${minutes} minutes ago';
  } else {
    formattedTime = '${seconds} seconds ago';
  }

  return formattedTime;
}
