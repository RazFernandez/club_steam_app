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
}
