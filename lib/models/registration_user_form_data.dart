/*  Sigleton class for storing user registration form data to be used in the
registration process 
*/

import 'package:flutter/material.dart';

class RegistrationUserFormData {
  // Singleton instance
  static final RegistrationUserFormData _instance =
      RegistrationUserFormData._();

  // Private constructor
  RegistrationUserFormData._();

  // Factory consturctor to create a single instance of the class
  factory RegistrationUserFormData() => _instance;

  // Controllers to retrieve the values of text fields]
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastFatherNameController =
      TextEditingController();
  final TextEditingController _lastMotherNameController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cellPhoneNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _userTypeController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _controlNumberController =
      TextEditingController();

  // Getters to retrieve TextEditingController objects
  TextEditingController get nameController => _nameController;
  TextEditingController get lastFatherNameController =>
      _lastFatherNameController;
  TextEditingController get lastMotherNameController =>
      _lastMotherNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get cellPhoneNumberController =>
      _cellPhoneNumberController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get userTypeController => _userTypeController;
  TextEditingController get unitController => _unitController;
  TextEditingController get controlNumberController => _controlNumberController;

  // Getters to retrieve the text value as a String
  String get name => _nameController.text;
  String get lastFatherName => _lastFatherNameController.text;
  String get lastMotherName => _lastMotherNameController.text;
  String get email => _emailController.text;
  String get cellPhoneNumber => _cellPhoneNumberController.text;
  String get password => _passwordController.text;
  String get confirmPassword => _confirmPasswordController.text;
  String get userType => _userTypeController.text;
  String get unit => _unitController.text;
  String get controlNumber => _controlNumberController.text;

  // returns true if any of the text fields
  // contain data, and false if they are all empty.
  bool hasAnyDataFilled() {
    return name.isNotEmpty ||
        lastFatherName.isNotEmpty ||
        lastMotherName.isNotEmpty ||
        email.isNotEmpty ||
        cellPhoneNumber.isNotEmpty ||
        password.isNotEmpty ||
        confirmPassword.isNotEmpty ||
        userType.isNotEmpty ||
        unit.isNotEmpty ||
        controlNumber.isNotEmpty;
  }

  // Clear data saved in textfields variables in memory
  void clearFields() {
    _nameController.clear();
    _lastFatherNameController.clear();
    _lastMotherNameController.clear();
    _emailController.clear();
    _cellPhoneNumberController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _userTypeController.clear();
    _unitController.clear();
    _controlNumberController.clear();
  }
}
