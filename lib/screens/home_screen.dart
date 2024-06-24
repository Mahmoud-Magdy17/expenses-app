import 'package:expenses_app/data/expenses.dart';
import 'package:expenses_app/main.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/chart.dart';
import 'package:expenses_app/widgets/expence_item.dart';
import 'package:flutter/material.dart';

import 'package:expenses_app/widgets/new_expence.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void removeResponse(Expense expense) {
    setState(() {
      expenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ThemeData.light().appBarTheme.backgroundColor,
        title: Text(
          "Expenses App",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: NewExpense(addExpense: addExpense),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Container(
          color: colorScheme.onPrimaryContainer,
          child: Column(
            children: [
              Chart(expenses: expenses),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (c, index) => Dismissible(
                    background: Container(
                      color: colorScheme.errorContainer,
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              Theme.of(context).cardTheme.margin!.horizontal),
                    ),
                    onDismissed: (direction) => removeResponse(
                      expenses[index],
                    ),
                    key: ValueKey(expenses[index]),
                    child: ExpenseItem(
                      index: index,
                    ),
                  ),
                  itemCount: expenses.length,
                ),
              )
            ],
          )),
    );
  }
}
