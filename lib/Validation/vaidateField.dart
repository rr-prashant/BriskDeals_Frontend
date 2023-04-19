import 'package:brisk_deals/Packages/Packages.dart';

class ValidationOfFields {
  static String? valName(String? value) {
    if (value == null) return "Empty field!";
    if (value.isEmpty) return 'Enter your name';
  }

  static String? valField(String? value) {
    if (value == null) return "Empty field!";
    if (value.isEmpty) return 'Empty Field!';
  }

  static String? valToken(String? value) {
    if (value == null) return "Empty field!";
    if (value.isEmpty) return 'Enter Your Confirmation Token.';
  }

  static String? valEmail(String? value) {
    if (value == null) return "Empty field!";
    if (value.isEmpty) return 'Enter email';

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter valid email';
    }
    return null;
  }

  static String? valPassword(String? value) {
    if (value == null) return "Empty field!";
    if (value.isEmpty) return 'Enter password';
    if (value.length < 7) {
      return 'Password must be more than 8 characters';
    }
    return null;
  }

  static String? valPhone(String? value) {
    if (value == null) return "Empty field!";
    if (value.isEmpty) return 'Enter your phone number';
    String pattern =
        r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';

    RegExp regex = RegExp(pattern);

    if (value.length < 10 || !regex.hasMatch(value)) {
      return "Please enter a valid phone number";
    } else {
      return null;
    }
  }
}
