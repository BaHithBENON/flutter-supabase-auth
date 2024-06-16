// ignore_for_file: avoid_print

extension StrinbgExtension on String? {
  /// Checks if the string is a valid email address.
  ///
  /// Returns true if the string is a valid email address, false otherwise.
  bool validEmail() {
    // Log the input string
    print('Input string: $this');

    // Regular expression for validating email addresses.
    // The regular expression matches a string that starts with one or more
    // alphanumeric characters or special characters (!#$%&'*+-/=?^_`{|}~), followed
    // by an '@' symbol, followed by one or more alphanumeric characters, followed
    // by a dot ('.'), and finally followed by one or more alphanumeric characters.
    // The regular expression is wrapped in double quotes (") to make it a string.
    // The 'r' before the opening double quote indicates that the string is a raw
    // string, which means that escape sequences are not processed.
    // The '^' and '$' symbols at the beginning and end of the regular expression
    // indicate that the entire string must match the regular expression.
    // The '+' symbol after the '.' character indicates that the dot character
    // should be matched one or more times.
    // The '[a-zA-Z0-9]' part of the regular expression matches any alphanumeric
    // character (either lowercase or uppercase letter, or digit).
    final RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+");

    // Log the regular expression
    print('Regular expression: $emailRegExp');

    // Returns true if the string matches the regular expression, false otherwise.
    final isValidEmail = emailRegExp.hasMatch('$this');

    // Log the result
    print('isValidEmail: $isValidEmail');

    return isValidEmail;
  }
}