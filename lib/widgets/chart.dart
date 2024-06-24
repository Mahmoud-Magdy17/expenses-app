import 'package:expenses_app/main.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/models/expense_bucket.dart';
import 'package:expenses_app/widgets/chart_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'expence_item.dart';

class Chart extends StatelessWidget {
  Chart({super.key, required this.expenses});
  final List<Expense> expenses;
  get buckets {
    return [
      ExpenseBucket.forCategory(cat: Category.food, allExpenses: expenses),
      ExpenseBucket.forCategory(cat: Category.learn, allExpenses: expenses),
      ExpenseBucket.forCategory(cat: Category.transport, allExpenses: expenses),
      ExpenseBucket.forCategory(cat: Category.luctury, allExpenses: expenses),
    ];
  }

  get maxBucketExpense {
    double maxBucket = 0;

    for (var element in buckets) {
      if (element.totalCostForCategory > maxBucket) {
        maxBucket = element.totalCostForCategory;
      }
    }

    return maxBucket;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (var ele in buckets) ChartBar(fill: ele.totalCostForCategory == 0?0:(ele.totalCostForCategory/maxBucketExpense)),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              for (var e in buckets)
                Expanded(
                  child: Icon(
                    categoryIcons[e.cat],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
