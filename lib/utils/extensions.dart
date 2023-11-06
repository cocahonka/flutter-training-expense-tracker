import 'package:intl/intl.dart';

extension Constants on Never {
  static final kDateFormatter = DateFormat.yMd();
}

extension StringX on String {
  String capitalise() => (length > 0) ? this[0].toUpperCase() + substring(1) : this;
}
