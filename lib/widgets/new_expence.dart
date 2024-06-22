import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:expenses_app/models/expense.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  DateTime? _selectedDate;
  final DateFormat _formatter = DateFormat.yMd();
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  Object? _selectedCategory = Category.food;

  @override
  void dispose() {
    super.dispose();
    _titleControler.dispose();
    _amountControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleControler,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _amountControler,
                    decoration: const InputDecoration(label: Text("Amount")),
                  )),
              const Spacer(),
              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? "no date selected"
                        : _formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: () async {
                        var now = DateTime.now();
                        var lastDate = DateTime.now();
                        var firstDate = DateTime(
                          now.year - 1,
                          now.month,
                          now.day,
                        );
                        DateTime? date = await showDatePicker(
                          lastDate: lastDate,
                          firstDate: firstDate,
                          context: context,
                          currentDate: now,
                        );
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                      icon: const Icon(Icons.calendar_month_rounded),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: [
                  ...Category.values.map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  ),
                ],
                onChanged: (e) {
                  if (e == null) {
                    return;
                  } else {
                    setState(() {
                      _selectedCategory = e;
                    });
                  }
                },
              ),
              ElevatedButton(
                onPressed: saveExpense,
                child: const Text("Save Expense"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cansel"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  saveExpense() {
    double? enteredAmount = double.tryParse(_amountControler.text);
    bool notValidAmout = (enteredAmount == null) || (enteredAmount <= 0.0);
    String enteredTitle = _titleControler.text.trim();
    if (notValidAmout || _selectedDate == null || enteredTitle.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("inValid Data"),
          content: Text("the data you entered is invalid"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("Okey"),
            )
          ],
        ),
      );
    } else {
      log(_titleControler.text);
      log(_amountControler.text);
    }
  }
}
