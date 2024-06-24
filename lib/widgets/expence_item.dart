import 'package:expenses_app/data/expenses.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

  final Map<Category, IconData> categoryIcons = {
    Category.food: Icons.dining_rounded,
    Category.learn: Icons.text_increase_sharp,
    Category.luctury: Icons.movie_filter_outlined,
    Category.transport: Icons.directions_bus_outlined,
  };
class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
        child: Column(
          children: [
            Text(
              expenses[index].title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Row(
              children: [
                Text("\$${expenses[index].cost}"),
                const Spacer(),
                Icon(categoryIcons[expenses[index].category]),
                const SizedBox(
                  width: 4,
                ),
                Text(expenses[index].dateTime),
              ],
            )
          ],
        ),
      ),
    );
  }
}
