import 'package:flutter/material.dart';

import 'package:expenses_app/widgets/expences_list.dart';
import 'package:expenses_app/widgets/new_expence.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses App"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: NewExpense(),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        color: Colors.amber,
        child: const ExpensesList(),
      ),
    );
  }
}
