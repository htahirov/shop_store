import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime? {
  String get formatDate => DateFormat('yyyy-MM-dd').format(this!);
}
