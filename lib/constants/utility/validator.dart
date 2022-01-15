String? validateEmailAddress(value) {
  String source =
      "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$";
  String? _msg;
  RegExp regExp = RegExp(source);
  if (value!.isEmpty) {
    _msg = 'Email is required';
  } else if (!regExp.hasMatch(value)) {
    _msg = 'Invalid Email';
  } else {
    _msg = null;
  }
  return _msg;
}

String? validatePassword(value) {
  String? _msg;
  if (value.isEmpty) {
    _msg = 'Please enter Password ';
  } else if (value.length < 8) {
    _msg = 'Must be at least 8 charater';
  }
  return _msg;
}

String? validateUserName(value) {
  String? _msg;
  if (value.isEmpty) {
    _msg = 'Please enter User Name ';
  } 
  return _msg;
}
