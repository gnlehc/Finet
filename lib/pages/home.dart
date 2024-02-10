import 'package:finet/model/quickaddtrans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final ProfilePicture picture = ProfilePicture(name: 'Chelsea' , radius: 32, fontsize: 21)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40, right: 20, left: 20, bottom: 40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
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
                            picture
                          ],

                        )
                      ],
                    )))));
  }

  Future<void> addTransaction() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final String description = descriptionController.text;
    final double price = double.parse(priceController.text);
    final DateTime time = DateTime.now();

    if (description.isNotEmpty && price != null) {
      final User? user = _auth.currentUser;

      if (user != null) {
        final String userId = user.uid;
        final DatabaseReference reference =
            FirebaseDatabase.instance.ref().child('QuickAddTransactions');
        final DatabaseReference newTransactionRef = reference.push();
        final transaction =
            QuickAddTransaction(userId, description, price, time);
        await newTransactionRef.set(transaction.toMap());
        print("Transaction added successfully");
      } else {
        print("User not logged in");
      }
    } else {
      print("Please fill in all the fields");
    }
  }
}
