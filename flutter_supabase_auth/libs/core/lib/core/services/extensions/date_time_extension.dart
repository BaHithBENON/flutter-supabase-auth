// ignore_for_file: avoid_print

extension DateTimeExtension on DateTime {
  /// Formats the DateTime object into an ISO 8601 string representation with an offset
  /// to indicate the timezone.
  ///
  /// Returns the formatted string.
  String toIso8601StringWithTz() {
    // Get the time zone offset
    final timeZoneOffset = this.timeZoneOffset;

    // Log the time zone offset
    print('Time zone offset: $timeZoneOffset');

    // Determine the sign of the offset
    final sign = timeZoneOffset.isNegative ? '-' : '+';

    // Log the sign of the offset
    print('Sign of offset: $sign');

    // Format the hours and minutes of the offset
    final hours = timeZoneOffset.inHours.abs().toString().padLeft(2, '0');
    final minutes = timeZoneOffset.inMinutes.abs().remainder(60).toString().padLeft(2, '0');

    // Log the formatted hours and minutes
    print('Formatted hours and minutes: $hours:$minutes');

    // Create the offset string
    final offsetString = '$sign$hours:$minutes';

    // Log the offset string
    print('Offset string: $offsetString');

    // Format the date and time without the milliseconds
    final formattedDate = toIso8601String().split('.').first;

    // Log the formatted date
    print('Formatted date: $formattedDate');

    // Combine the formatted date and offset to create the final string
    final finalString = '$formattedDate$offsetString';

    // Log the final string
    print('Final string: $finalString');

    return finalString;
  }
}
