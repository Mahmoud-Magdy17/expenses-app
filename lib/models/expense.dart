import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

Uuid uuid = const Uuid();
DateFormat dateFormat = DateFormat.yMd();

enum Category { food, transport, learn, luctury }

class Expense {
  final String id;
  final String title;
  final double cost;
  final DateTime date;
  final Category category;

  Expense(
      {required this.category,
      required this.title,
      required this.cost,
      required this.date})
      : id = uuid.v4();
  String get dateTime {
    return dateFormat.format(date);
  }
}
