import 'package:finet/model/quick_add_transactions_model.dart';
import 'package:finet/user_auth/user_provider.dart';
import 'package:finet/views/widgets/home/bottomNavbar.dart';
import 'package:finet/views/widgets/home/currentBalance.dart';
import 'package:finet/views/widgets/home/dailyExpenses.dart';
import 'package:finet/views/widgets/expenses/todays_expenses.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final ProfilePicture picture =
      const ProfilePicture(name: 'Chelsea', radius: 32, fontsize: 21);

  int _selectedIndex = 0;

  // for bottom navbar navigation
  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/home');
        break;
      case 2:
        Navigator.pushNamed(context, '/home');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    String userEmail = user?.email ?? '';
    List<String> emailParts = userEmail.split('@');
    String username = emailParts.isNotEmpty ? emailParts.first : '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(children: <Widget>[
        const Positioned(
          top: -80,
          right: -80,
          child: Image(
            image: AssetImage('assets/img/homecirclesbg.png'),
            width: 400,
          ),
        ),
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: const Icon(
                Icons.more_vert,
                color: Color(0xFF3362AB),
              ),
            ),
            const Padding(
                padding:
                    EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 40),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome,',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w500),
                          ),
                          Text('Chelsea Ng',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    SizedBox(height: 18),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DailyExpenses(),
                      ],
                    ),
                    SizedBox(height: 22),
                    CurrentBalance(),
                    SizedBox(height: 22),
                    TodaysExpenses(),
                  ],
                ))
          ],
        )
      ])),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onNavBarTap,
      ),
    );
  }

  // Future<void> addTransaction() async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;

  //   final String description = descriptionController.text;
  //   final double price = double.parse(priceController.text);
  //   final DateTime time = DateTime.now();

  //   if (description.isNotEmpty) {
  //     final User? user = auth.currentUser;

  //     if (user != null) {
  //       final String userId = user.uid;
  //       final DatabaseReference reference =
  //           FirebaseDatabase.instance.ref().child('QuickAddTransactions');
  //       final DatabaseReference newTransactionRef = reference.push();
  //       final transaction =  QuickAddTransactions(
  //         userId: userId,
  //         description: description,
  //         price: price.toInt(),
  //         time: time,
  //       );
  //       await newTransactionRef.set(transaction.toMap());
  //       print("Transaction added successfully");
  //     } else {
  //       print("User not logged in");
  //     }
  //   } else {
  //     print("Please fill in all the fields");
  //   }
  // }
}
