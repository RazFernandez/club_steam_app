import 'package:flutter/material.dart';

class LinearProgressBarProvider with ChangeNotifier {
  int _currentStep = 1;
  final int _totalSteps;

  LinearProgressBarProvider(this._totalSteps);

  int get currentStep => _currentStep;
  int get totalSteps => _totalSteps;

  void incrementStep() {
    if (_currentStep < _totalSteps) {
      _currentStep++;
      notifyListeners();
    }
  }

  void resetSteps() {
    _currentStep = 0;
    notifyListeners();
  }
}
