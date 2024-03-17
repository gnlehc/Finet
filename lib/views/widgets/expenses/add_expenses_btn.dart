import 'package:flutter/material.dart';

class AddExpensesButton extends StatelessWidget {
  const AddExpensesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/add-expenses');
        },
        child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFCDDFF3),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(12.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Color(0xFF438BEF), size: 16),
                    SizedBox(width: 8.0),
                    Text(
                      "Add new spending",
                      style: TextStyle(
                        color: Color(0xFF438BEF),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
