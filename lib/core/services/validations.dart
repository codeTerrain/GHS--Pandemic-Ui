class Validations {
  String validateName(String value) {
    if (value.isEmpty) return 'Username is required.';
    final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String validateAge(String value) {
    if (value.isEmpty) return 'Age is required.';
    final RegExp nameExp = new RegExp(r'^[0-9 ]+$');
    if (!nameExp.hasMatch(value)) return 'Please enter a valid age.';
    return null;
  }

  String validatePhone(String value) {
    String patttern = r'(^(?:[+0]233)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String validateEmail(value) {
    if (value.isEmpty) return 'Email is required.';
    final RegExp nameExp = new RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
    if (!nameExp.hasMatch(value.toString().trim()))
      return '   Invalid email address';
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) return 'Please enter a password.';
    return null;
  }
}
