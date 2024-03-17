import 'package:finet/views/widgets/expenses/add_expenses_btn.dart';
import 'package:finet/views/widgets/expenses/expenses_card.dart';
import 'package:flutter/material.dart';

class TodaysExpenses extends StatelessWidget {
  const TodaysExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Text('Today\'s Spendings',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600))),
        SizedBox(height: 14),
        AddExpensesButton(),
        SizedBox(height: 12),
        ExpensesCard(),
        SizedBox(height: 12),
      ],
    );
  }
}
