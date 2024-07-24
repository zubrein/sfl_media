import 'package:intl/intl.dart';

final _dateTimeFormatter = DateFormat('yyyy-MM-ddTHH:mm:ss');
final _dateTime = DateFormat('MMMM dd, yyy');

String formattedDate(date) {
  return _dateTime.format(_dateTimeFormatter.parse(date));
}
