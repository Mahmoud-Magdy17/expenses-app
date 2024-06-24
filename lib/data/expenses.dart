import 'package:expenses_app/models/expense.dart';

List<Expense> expenses = [
  Expense(
    title: "Food",
    cost: 19.5,
    date: DateTime.now(),
    category: Category.food,
  ),
  Expense(
      title: "Transport",
      cost: 15,
      date: DateTime.now(),
      category: Category.transport),
  Expense(
      title: "Learn",
      cost: 9,
      date: DateTime.now(),
      category: Category.learn),
  Expense(
      title: "Luctury",
      cost: 30,
      date: DateTime.now(),
      category: Category.luctury),
];
