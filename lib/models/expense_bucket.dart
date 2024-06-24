import 'package:expenses_app/models/expense.dart';

class ExpenseBucket {
  ExpenseBucket(this.cat, this.expenses);
  final Category cat;
  List<Expense> expenses;
  ExpenseBucket.forCategory(
      {required List<Expense> allExpenses, required this.cat})
      : expenses =
            allExpenses.where((element) => element.category == cat).toList();

  double get totalCostForCategory {
    double sum = 0;
    for (var element in expenses) {
      element.category == cat ? sum += element.cost : sum += 0;
    }
    return sum;
  }
}
