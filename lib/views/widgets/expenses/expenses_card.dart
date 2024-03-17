import 'package:flutter/material.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Color(0xFFE1E1E1), width: 1.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("S&S Kitchen - Ricebowl",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13)),
                SizedBox(height: 8),
                // category
                Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 205, 205),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.only(
                        top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
                    child: Text(
                      "Food",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "- Rp. 25.000,00",
                  style: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
                SizedBox(height: 6),
                Text(
                  "Spending Account",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 11),
                ),
              ],
            ),
          ],
        ));
  }
}
