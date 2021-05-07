import 'package:fzregex/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';

class FzValidation {
  /// Email Validation
  static String emailValidator(String value) {
    var error = 'Email is not valid';

    if (value.isEmpty)
      // Email Form Field is Empty
      error = "Email can\'t be empty";

    if (Fzregex.hasMatch(value, FzPattern.email))
      // Email is valid
      error = null;

    // The pattern of the email didn't match the regex in Fzregex.
    return error;
  }

  /// Password Validation
  static String passwordValidator(String password) {
    var error =
        'Password must contain at least: 1 uppercase letter, 1 lowecase letter, 1 number & 1 special character';
    if (password.isEmpty) error = 'Password can\'t be empty';

    if (Fzregex.hasMatch(password, FzPattern.passwordHard)) error = null;

    return error;
  }

  /// Name Validation
  static String nameValidator(String name) {
    var error = 'Name can\'t contain numbers or whitespaces';
    if (name.isEmpty) error = 'Name can\'t be empty';

    if (Fzregex.hasMatch(name, FzPattern.alphabetOnly)) error = null;

    return error;
  }
}
