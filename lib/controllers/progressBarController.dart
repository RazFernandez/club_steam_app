class ProgressBarController {
  double? _progress; // Current progress
  double? _steps; // Total steps

  // Constructor
  ProgressBarController({required double progress, required double steps}) {
    _progress = progress;
    _steps = steps;
  }

  // Getter for current progress
  double? get progress => _progress;

  // Getter for current steps
  double? get steps => _steps;

  // Method to set the progress
  void setProgress(double value) {
    if (value >= 0.0 && value <= 1.0) {
      _progress = value;
    }
  }

  // Method to set the steps
  void setSteps(double value) {
    if (value >= 0.0) {
      _steps = value;
    }
  }

  // // Obtener el número de pasos
  // double? getSteps() {
  //   return _steps;
  // }

  // // Method to add a step to the linear progress bar
  // void addStep() {
  //   if (_progress < _steps) {
  //     _progress += 1.0;
  //   }
  // }

  // // Method to subtract a step from the linear progress bar

  // void subtractStep() {
  //   if (_progress > 0.0) {
  //     _progress -= 1.0;
  //   }
  // }

  // // Method to add `n` steps to the linear progress bar
  // void addSteps(double stepsToAdd) {
  //   if (_progress + stepsToAdd <= _steps) {
  //     _progress += stepsToAdd;
  //   }
  // }

  // // Method to subtract `n` steps from the linear progress bar
  // void subtractSteps(double stepsToSubtract) {
  //   if (_progress - stepsToSubtract >= 0.0) {
  //     _progress -= stepsToSubtract;
  //   }
  // }

  // // Reiniciar el progreso
  // void resetProgress() {
  //   _progress = 0.0;
  // }
}
