import 'package:flutter/material.dart';
import 'ValidationModel.dart';

class Validation with ChangeNotifier {
  ValidationModel _email = ValidationModel(value: null, error: null);
  ValidationModel _password = ValidationModel(value: null, error: null);
  ValidationModel _firstName = ValidationModel(
    value: null,
    error: null,
  );
  ValidationModel _lastName = ValidationModel(
    value: null,
    error: null,
  );
  ValidationModel _phoneNumber = ValidationModel(value: null, error: null);
  //getters
  ValidationModel get email => _email;
  ValidationModel get password => _password;
  ValidationModel get firstName => _firstName;
  ValidationModel get lastName => _lastName;
  ValidationModel get phoneNumber => _phoneNumber;

  bool get isValid {
    if (_email.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  validateEmail(String value) {
    if (value.contains("@") && value.length >= 8 && value.isNotEmpty) {
      _email = ValidationModel(value: value, error: null);
    } else {
      _email = ValidationModel(value: null, error: "Enter a valid email");
    }
    notifyListeners();
  }

  validatePassword(String value) {
    if (value.isNotEmpty && value.length >= 8) {
      _password = ValidationModel(value: value, error: null);
    } else {
      _password = ValidationModel(value: null, error: "Enter a valid password");
    }
    notifyListeners();
  }

  validatefirstName(String value) {
    if (value.isNotEmpty && value.length >= 3) {
      _firstName = ValidationModel(
        value: value,
        error: null,
      );
    } else {
      _firstName = ValidationModel(
        value: null,
        error: "firstName should not be less than 3 characters",
      );
    }
    notifyListeners();
  }

  validatelastName(String value) {
    if (value.isNotEmpty && value.length >= 3) {
      _lastName = ValidationModel(
        value: value,
        error: null,
      );
    } else {
      _lastName = ValidationModel(
        value: null,
        error: "LastName should not be less than 3 characters",
      );
    }
    notifyListeners();
  }

  validatePhone(String value) {
    if (value.isNotEmpty && value.length >= 8 && value.startsWith("+")) {
      _phoneNumber = ValidationModel(value: value, error: null);
    } else {
      _phoneNumber = ValidationModel(
          value: null,
          error: "Phone must be 8 digits long and starts with + country code");
    }
    notifyListeners();
  }
}
