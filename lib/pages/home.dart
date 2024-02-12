import 'package:finet/model/quickaddtrans.dart';
import 'package:finet/user_auth/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final ProfilePicture picture =
      const ProfilePicture(name: 'Chelsea', radius: 32, fontsize: 21);
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
                                Text('$username',
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
    final FirebaseAuth auth = FirebaseAuth.instance;

    final String description = descriptionController.text;
    final double price = double.parse(priceController.text);
    final DateTime time = DateTime.now();

    if (description.isNotEmpty) {
      final User? user = auth.currentUser;

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
