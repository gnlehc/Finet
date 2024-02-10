// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

// class TransactionList extends StatefulWidget {
//   @override
//   _TransactionListState createState() => _TransactionListState();
// }

// class _TransactionListState extends State<TransactionList> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref().child('QuickAddTransactions');

//   late User? _user;
//   List<Transaction> _userTransactions = [];

//   @override
//   void initState() {
//     super.initState();
//     _user = _auth.currentUser;
//     if (_user != null) {
//       _fetchUserTransactions(_user!.uid);
//     }
//   }

//   Future<void> _fetchUserTransactions(String userId) async {
//     final DataSnapshot dataSnapshot = await _databaseReference.orderByChild('userId').equalTo(userId).once();

//     if (dataSnapshot.value != null) {
//       Map<String, dynamic> transactionsMap = dataSnapshot.value;
//       transactionsMap.forEach((key, value) {
//         _userTransactions.add(Transaction.fromMap(value));
//       });

//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Transactions'),
//       ),
//       body: _user != null
//           ? ListView.builder(
//               itemCount: _userTransactions.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_userTransactions[index].description),
//                   subtitle: Text('Price: ${_userTransactions[index].price.toString()}'),
//                   // Add more details as needed
//                 );
//               },
//             )
//           : Center(
//               child: Text('User not logged in'),
//             ),
//     );
//   }
// }

// class Transaction {
//   late String description;
//   late double price;
//   late String userId;

//   Transaction(this.description, this.price, this.userId);

//   Transaction.fromMap(Map<dynamic, dynamic> map)
//       : description = map['description'],
//         price = map['price'].toDouble(),
//         userId = map['userId'];

//   Map<String, dynamic> toMap() {
//     return {
//       'description': description,
//       'price': price,
//       'userId': userId,
//     };
//   }
// }
