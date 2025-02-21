enum Gender { male, female }
class UserProfile {
  final String email;
  String? username;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? password;
  DateTime? dateOfBirth;
  String? bio;
  Gender? gender;

  UserProfile({
    required this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.password,
    this.dateOfBirth,
    this.bio,
    this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'password': password,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'bio': bio,
      'gender': gender?.index,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      email: map['email'],
      username: map['username'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      bio: map['bio'],
      gender: map['gender'] != null ? Gender.values[map['gender']] : null,
    );
  }
}
