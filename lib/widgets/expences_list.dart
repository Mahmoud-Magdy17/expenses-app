import 'package:expenses_app/data/expenses.dart';
import 'package:expenses_app/widgets/expence_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (c, index) => ExpenseItem(index: index,),
      itemCount: expenses.length,
    );
  }
}
