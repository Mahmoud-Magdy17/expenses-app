import 'package:expenses_app/data/expenses.dart';
import 'package:expenses_app/widgets/expences_list.dart';
import 'package:flutter/material.dart';

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
                        height: 250,
                        width: double.infinity,
                        child: Text("data"),
                      );
                    });
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Container(color: Colors.amber, child: const ExpensesList()));
  }
}
