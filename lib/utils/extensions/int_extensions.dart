extension IntExtensions on int {
  bool get isSuccess => this >= 200 && this < 300;
  bool get isFailure => this >= 400 && this < 500;

}
