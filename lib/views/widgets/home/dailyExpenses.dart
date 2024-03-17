import 'package:flutter/material.dart';

class DailyExpenses extends StatelessWidget {
  const DailyExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Daily Expenses: ",
            style: TextStyle(
                color: Color(0xFF438BEF),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 12),
        SingleChildScrollView(
          
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // Add your button press logic here
                    print("Button Pressed");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Color(0xFFE1E1E1), width: 1.0),
                    ),
                    padding: EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('🚊',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500)),
                        SizedBox(width: 6),
                        Text(
                          "Commute",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Rp. 3.500",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 6.0),
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 6),
                InkWell(
                  onTap: () {
                    // Add your button press logic here
                    print("Button Pressed");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Color(0xFFE1E1E1), width: 1.0),
                    ),
                    padding: EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('☕',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500)),
                        SizedBox(width: 6),
                        Text(
                          "Coffee",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Rp. 15.000",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 6.0),
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
