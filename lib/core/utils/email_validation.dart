class EmailValidation {
  static bool isValidEmail(String email) {
    return RegExp(emailRegExp).hasMatch(email);
  }
}

const emailRegExp = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
