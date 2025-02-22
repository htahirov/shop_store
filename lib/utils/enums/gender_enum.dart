enum Gender {
  male,
  female;

  const Gender();

  static Gender? fromText(String? genderName) {
    if (genderName == Gender.male.name) {
      return Gender.male;
    } else if (genderName == Gender.female.name) {
      return Gender.female;
    } else {
      return null;
    }
  }
}
