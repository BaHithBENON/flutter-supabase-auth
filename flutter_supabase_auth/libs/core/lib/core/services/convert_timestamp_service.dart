// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../utilities/variables/app_texts.dart';

class ConvertTimestampService {
  // 
  /// Converts a timestamp to a formatted date and time string.
  ///
  /// The timestamp is converted to a date string using the [toDate] method
  /// and a time string using the [toTime] method. The two strings are then
  /// concatenated with a hyphen in between and returned as the result.
  ///
  /// Parameters:
  ///   - timestamp: The timestamp to be converted.
  ///
  /// Returns:
  ///   A string in the format "date - time".
  static String toDateTime(String timestamp) {
    // Log the input timestamp.
    print("Input timestamp: $timestamp");

    // Convert the timestamp to a date string.
    String date_ = toDate(timestamp);

    // Log the date string.
    print("Date string: $date_");

    // Convert the timestamp to a time string.
    String time_ = toTime(timestamp);

    // Log the time string.
    print("Time string: $time_");

    // Concatenate the date and time strings with a hyphen in between.
    String result = "$date_ - $time_";

    // Log the result.
    print("Result: $result");

    return result;
  }

  /// Converts the given number of seconds into a formatted time string.
  ///
  /// If the number of seconds is less than 0, the function returns the number of
  /// seconds as a string. Otherwise, it returns the number of seconds as a string
  /// with the unit "s" appended to it.
  ///
  /// Parameters:
  ///   - seconds: The number of seconds to be converted.
  ///
  /// Returns:
  ///   A string representing the number of seconds in the format "seconds s".
  static String secondToTime(int seconds) {
    // Log the input seconds.
    print("Input seconds: $seconds");

    // Initialize the time string with the number of seconds.
    String time_ = "$seconds s";

    // Convert the number of seconds into a Duration object.
    final duration = Duration(seconds: seconds);

    // If the number of seconds is less than 0, return the number of seconds as a string.
    if (duration.inMinutes < 0) {
      // If the number of seconds is less than 10, prefix it with a "0".
      String s = duration.inSeconds < 10
          ? "0${duration.inSeconds} s"
          : "${duration.inSeconds} s";
      // Set the time string to the modified number of seconds.
      time_ = s;
    }

    // Log the time string.
    print("Time string: $time_");

    // Return the formatted time string.
    return time_;
  }

  /// Converts the given timestamp to a formatted time string.
  ///
  /// Parameters:
  ///   - timestamp: The timestamp to be converted.
  ///
  /// Returns:
  ///   A string representing the time in the format "hour:minutes".
  static String toTime(String timestamp) {
    // Log the input timestamp.
    print("Input timestamp: $timestamp");

    // Convert the timestamp to a DateTime object.
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));

    // Log the hour and minute of the DateTime object.
    print("Hour: ${_time.hour}, Minute: ${_time.minute}");

    // Get the hour and minute from the DateTime object.
    // If the hour or minute is less than 10, prefix it with a "0".
    String hour = _time.hour < 10 ? "0${_time.hour}" : _time.hour.toString();
    String min = _time.minute < 10 ? "0${_time.minute}" : _time.minute.toString();

    // Concatenate the hour and minute with a colon in between.
    String time_ = "$hour:$min";

    // Log the formatted time string.
    print("Formatted time string: $time_");

    // Return the formatted time string.
    return time_;
  }


  /// Checks if two timestamps represent the same date.
  ///
  /// Parameters:
  ///   - timestamp1: The first timestamp to be compared.
  ///   - timestamp2: The second timestamp to be compared.
  ///
  /// Returns:
  ///   A boolean indicating whether the two timestamps represent the same date.
  static bool isSameDate(String timestamp1, String timestamp2) {
    // Log the input timestamps.
    print("Input timestamps: $timestamp1, $timestamp2");

    // Convert the timestamps to DateTime objects.
    DateTime time1_ = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp1));
    DateTime time2_ = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp2));

    // Log the DateTime objects for the input timestamps.
    print("DateTime objects for input timestamps: $time1_, $time2_");

    // Check if the year, month, and day of the two DateTime objects are the same.
    // If they are, return true; otherwise, return false.
    bool result =
        (time1_.year == time2_.year) &&
        (time1_.month == time2_.month) &&
        (time1_.day == time2_.day);

    // Log the result.
    print("Result: $result");

    return result;
  }


  /// Calculates the time spent in days between a given timestamp and the current time.
  ///
  /// Parameters:
  ///   - timestamp: The initial timestamp to calculate the time spent from.
  ///   - nbreDays: The number of days to add to the initial timestamp.
  ///
  /// Returns:
  ///   An integer representing the number of days spent.
  ///
  /// This function takes a timestamp and a number of days as input parameters.
  /// It calculates the time spent in days between the given timestamp and the current time.
  /// The function converts the timestamp to a DateTime object and adds the specified number of days to it.
  /// Then, it calculates the difference between the resulting DateTime object and the current time.
  /// Finally, it extracts the number of days from the resulting Duration object and returns it as an integer.
  static int timeSpentInDdays(String timestamp, int nbreDays) {
    // Log the input parameters.
    print("Input parameters: timestamp=$timestamp, nbreDays=$nbreDays");

    // Convert the timestamp to a DateTime object.
    DateTime time_ = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));

    // Add the specified number of days to the DateTime object.
    DateTime timeAdd_ = time_.add(Duration(days: nbreDays));

    // Calculate the difference between the resulting DateTime object and the current time.
    Duration spent_ = timeAdd_.difference(DateTime.now());

    // Extract the number of days from the resulting Duration object.
    int inDays_ = spent_.inDays;

    // Log the result.
    print("Result: $inDays_ days spent");

    // Return the number of days spent.
    return inDays_;
  }

  /// Calculates the time spent in a given number of hours between a given timestamp and the current time.
  ///
  /// Parameters:
  ///   - timestamp: The initial timestamp to calculate the time spent from.
  ///   - nbreHours: The number of hours to add to the initial timestamp.
  ///
  /// Returns:
  ///   A string representing the time spent in the format "X day(s) Y hour(s)".
  static String timeSpent(String timestamp, int nbreHours) {
    // Log the input parameters.
    print("Input parameters: timestamp=$timestamp, nbreHours=$nbreHours");

    // Convert the timestamp to a DateTime object.
    DateTime time_ = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    // Add the specified number of hours to the DateTime object.
    DateTime timeAdd_ = time_.add(Duration(hours: nbreHours));
    // Calculate the difference between the resulting DateTime object and the current time.
    Duration spent_ = timeAdd_.difference(DateTime.now());
    // Calculate the number of seconds in the difference.
    int secs_ = spent_.inSeconds;

    // Define strings for different time units.
    String unitySecs_ = "seconde(s)";
    String unityMins_ = "minute(s)";
    String unityHours_ = "heure(s)";
    String unityDays_ = "jour(s)";

    // Initialize the response string.
    String response_ = "";

    // Log the number of seconds.
    print("Number of seconds: $secs_");

    // If the number of seconds is less than 0, set the response to an empty string.
    if(secs_ < 0) {
      response_ = "";
    }
    // If the number of seconds is less than or equal to 60, format the response as "X seconds".
    else if (secs_ <= 60) {
      response_ += "$secs_ $unitySecs_";
    }
    // If the number of seconds is greater than 60 but less than or equal to 3600, format the response as "X minutes Y seconds".
    else if((3600 > secs_) && (secs_ > 60)){
      int resMins =  int.parse("${(secs_ / 60)}");
      int resSecs = secs_ % 60;
      response_ += "$resMins $unityMins_ $resSecs $unitySecs_";
    }
    // If the number of seconds is greater than 3600 but less than or equal to 86400, format the response as "X hours Y minutes".
    else if((86400 > secs_) && (secs_ > 3600)){
      double res = secs_ / 3600;
      int resHours = res.toInt();
      int resMins = secs_ % 60;
      response_ += "$resHours $unityHours_ $resMins $unityMins_";
    }
    // If the number of seconds is greater than or equal to 86400, format the response as "X days Y hours".
    else if(secs_ >= 86400){
      int resDays = int.parse("${(secs_ / 86400)}");
      int resHours = int.parse("${((secs_ % 86400) / 3600)}");
      response_ += "$resDays $unityDays_ $resHours $unityHours_";
    }

    // Log the response string.
    print("Response: $response_");

    return response_;
  }

  /// Converts a timestamp to a formatted date string.
  ///
  /// The timestamp is converted to a DateTime object using the [DateTime.fromMillisecondsSinceEpoch] method.
  /// The day, month, and year of the DateTime object are then formatted into a string using the following format: "DD MMM YYYY".
  ///
  /// Parameters:
  ///   - timestamp: The timestamp to be converted.
  ///
  /// Returns:
  ///   A string representing the date in the format "DD MMM YYYY".
  static String toDate(String timestamp) {
    // Log the input timestamp.
    print("Input timestamp: $timestamp");

    // Convert the timestamp to a DateTime object.
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));

    // Log the day, month, and year of the DateTime object.
    print("Day: ${_time.day}, Month: ${_time.month}, Year: ${_time.year}");

    // Format the day, month, and year into a string.
    String day = _time.day < 10 ? "0${_time.day}" : _time.day.toString();
    String year = _time.year.toString();
    String month = "Jan";
    switch (_time.month) {
      case 1:
        month = "Jan";
        break;
      case 2:
        month = "Fev";
        break;
      case 3:
        month = "Mar";
        break;
      case 4:
        month = "Avr";
        break;
      case 5:
        month = "Mai";
        break;
      case 6:
        month = "Jun";
        break;
      case 7:
        month = "Jul";
        break;
      case 8:
        month = "Aôut";
        break;
      case 9:
        month = "Sept";
        break;
      case 10:
        month = "Oct";
        break;
      case 11:
        month = "Nov";
        break;
      case 12:
        month = "Dec";
        break;
      default:
        month = "Janv";
    }

    // Concatenate the formatted day, month, and year into a string.
    String _date = "$day $month $year";

    // Log the formatted date string.
    print("Formatted date string: $_date");

    // Return the formatted date string.
    return _date;
  }

  /// Converts a timestamp to a formatted day string.
  ///
  /// The timestamp is converted to a DateTime object using the
  /// [DateTime.fromMillisecondsSinceEpoch] method. The day of the
  /// DateTime object is then formatted into a string using the
  /// following format: "DD". If the day is less than 10, a leading
  /// zero is added to the day string.
  ///
  /// Parameters:
  ///   - timestamp: The timestamp to be converted.
  ///
  /// Returns:
  ///   A string representing the day in the format "DD".
  static String getDay(String timestamp) {
    // Log the input timestamp.
    print("Input timestamp: $timestamp");

    // Convert the timestamp to a DateTime object.
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));

    // Format the day into a string.
    String day = _time.day < 10 ? "0${_time.day}" : _time.day.toString();

    // Log the formatted day string.
    print("Formatted day string: $day");

    // Return the formatted day string.
    return day;
  }


  /// Returns the month name based on the given timestamp.
  ///
  /// The timestamp is converted to a DateTime object using the
  /// [DateTime.fromMillisecondsSinceEpoch] method. The month name is then
  /// determined based on the month value of the DateTime object.
  ///
  /// Parameters:
  ///   - timestamp: The timestamp to be converted.
  ///
  /// Returns:
  ///   A string representing the month name.
  static String getMonth(String timestamp) {
    // Log the input timestamp.
    print("Input timestamp: $timestamp");

    // Convert the timestamp to a DateTime object.
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));

    // Determine the month name based on the month value of the DateTime object.
    String month;
    switch (_time.month) {
      case 1:
        month = "Janvier"; // January
        break;
      case 2:
        month = "Février"; // February
        break;
      case 3:
        month = "Mars"; // March
        break;
      case 4:
        month = "Avril"; // April
        break;
      case 5:
        month = "Mai"; // May
        break;
      case 6:
        month = "Juin"; // June
        break;
      case 7:
        month = "Juillet"; // July
        break;
      case 8:
        month = "Aôut"; // August
        break;
      case 9:
        month = "Septembre"; // September
        break;
      case 10:
        month = "Octobre"; // October
        break;
      case 11:
        month = "Novembre"; // November
        break;
      case 12:
        month = "Decembre"; // December
        break;
      default:
        month = "Janvier"; // Default to January
    }

    // Log the determined month name.
    print("Determined month name: $month");

    // Return the month name.
    return month;
  }

  /// Retrieves the year from a given timestamp.
  ///
  /// Parameters:
  ///   - timestamp: The timestamp from which to retrieve the year.
  ///
  /// Returns:
  ///   A string representing the year.
  static String getYear(String timestamp) {
    // Log the input timestamp.
    print("Input timestamp: $timestamp");

    // Convert the timestamp to a DateTime object.
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));

    // Log the year of the DateTime object.
    print("Year: ${_time.year}");

    // Get the year from the DateTime object and convert it to a string.
    String year = _time.year.toString();

    // Log the determined year.
    print("Determined year: $year");

    return year;
  }

  /// Displays a date picker dialog and returns the selected date.
  ///
  /// Parameters:
  ///   - context: The build context used to display the dialog.
  ///   - startDate: The initial date to be displayed in the dialog. If not provided,
  ///     the current date is used as the initial date.
  ///
  /// Returns:
  ///   A [Future] that resolves to the selected date. If the user cancels the dialog,
  ///   the future resolves to `null`.
  static Future<DateTime?> showTheDatePicker(BuildContext context, {DateTime? startDate}) async {
    // Log the input parameters.
    print("Input parameters: context: $context, startDate: $startDate");

    // Display the date picker dialog.
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(), // Use the provided start date or the current date as the initial date.
      firstDate: startDate ?? DateTime.now(), // Use the provided start date or the current date as the earliest selectable date.
      lastDate: DateTime.now().add(const Duration(days: 365)), // Set the latest selectable date to 365 days from the current date.
      confirmText: AppTexts.toConfirm, // Set the confirm button text.
      cancelText: AppTexts.toCancel, // Set the cancel button text.
      helpText: AppTexts.date, // Set the help text.
    );

    // Log the selected date.
    print("Selected date: $selectedDate");

    // Return the selected date.
    return selectedDate;
  }

  /// Displays a time picker dialog and returns the selected time.
  ///
  /// Parameters:
  ///   - context: The build context used to display the dialog.
  ///
  /// Returns:
  ///   A [Future] that resolves to the selected time. If the user cancels the dialog,
  ///   the future resolves to `null`.
  static Future<TimeOfDay?> showTheTimePicker(BuildContext context) async {
    // Log the input parameters.
    print("Input parameters: context: $context");

    // Display the time picker dialog.
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // Use the current time as the initial time.
      confirmText: AppTexts.toConfirm, // Set the confirm button text.
      cancelText: AppTexts.toCancel, // Set the cancel button text.
      helpText: AppTexts.hourAndMinutes, // Set the help text.
    );

    // Log the selected time.
    print("Selected time: $selectedTime");

    // Return the selected time.
    return selectedTime;
  }

  /// Converts a [TimeOfDay] object to a formatted time string.
  ///
  /// The time string is in the format "hour:minutes AM/PM".
  ///
  /// Parameters:
  ///   - timeOfDay: The [TimeOfDay] object to be converted.
  ///
  /// Returns:
  ///   A string representing the formatted time.
  static String toHour(TimeOfDay timeOfDay) {
    // Initialize the time string with the hour and minute.
    String time = "${timeOfDay.hour}:${timeOfDay.minute}";

    // Log the input timeOfDay.
    print("Input timeOfDay: $timeOfDay");

    // Initialize the hour, minutes, and ampm strings.
    String hour = "";
    String minutes = "";
    String ampm = "";

    // If the hour is less than 10, prefix it with a "0".
    if (timeOfDay.hour < 10) {
      hour = "0${timeOfDay.hour}";
    } else {
      hour = "${timeOfDay.hour}";
    }

    // Log the hour string.
    print("Hour string: $hour");

    // If the minute is less than 10, prefix it with a "0".
    if (timeOfDay.minute < 10) {
      minutes = "0${timeOfDay.minute}";
    } else {
      minutes = "${timeOfDay.minute}";
    }

    // Log the minutes string.
    print("Minutes string: $minutes");

    // Determine the AM/PM value based on the period.
    if (timeOfDay.period == DayPeriod.am) {
      ampm = "AM";
    } else {
      ampm = "PM";
    }

    // Log the AM/PM value.
    print("AM/PM value: $ampm");

    // Concatenate the hour, minutes, and ampm strings with a space in between.
    time = "$hour:$minutes $ampm";

    // Log the formatted time string.
    print("Formatted time string: $time");

    // Return the formatted time string.
    return time;
  }
}

