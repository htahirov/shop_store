class PasswordCondition {
  final String message;
  final bool isMet;

  const PasswordCondition({
    required this.message,
    required this.isMet,
  });
}

class PasswordValidationState {
  final bool hasMinLength;
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumber;
  final bool hasSpecialChar;

  const PasswordValidationState({
    this.hasMinLength = false,
    this.hasUppercase = false,
    this.hasLowercase = false,
    this.hasNumber = false,
    this.hasSpecialChar = false,
  });

  bool get isValid => 
    hasMinLength && 
    hasUppercase && 
    hasLowercase && 
    hasNumber && 
    hasSpecialChar;

  List<PasswordCondition> get conditions => [
    PasswordCondition(
      message: 'At least 8 characters',
      isMet: hasMinLength,
    ),
    PasswordCondition(
      message: 'At least one uppercase letter',
      isMet: hasUppercase,
    ),
    PasswordCondition(
      message: 'At least one lowercase letter',
      isMet: hasLowercase,
    ),
    PasswordCondition(
      message: 'At least one number',
      isMet: hasNumber,
    ),
    PasswordCondition(
      message: 'At least one special character (!@#\$&*~)',
      isMet: hasSpecialChar,
    ),
  ];
}