import 'package:finet/bloc/ecategory/ecategory_bloc.dart';
import 'package:finet/bloc/ecategory/ecategory_event.dart';
import 'package:finet/bloc/ecategory/ecategory_state.dart';
import 'package:finet/views/widgets/expenses/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpensesForm extends StatelessWidget {
  AddExpensesForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  List<bool> buttonStates = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, size: 18),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        const Text(
          "Add new expense",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        const Text("Enter the details to your expense.",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400)),
        const SizedBox(height: 20),
        Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // SizedBox(height: 12),
                // title
                TextField(
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    suffixIcon: Icon(Icons.edit,
                        size: 20, color: Colors.grey[600]), // Set icon color
                    labelText: 'Title',
                    labelStyle:
                        TextStyle(color: Colors.grey[600]), // Set title color
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    suffixIcon: Icon(Icons.edit_note,
                        size: 20, color: Colors.grey[600]), // Set icon color
                    labelText: 'Description',
                    labelStyle:
                        TextStyle(color: Colors.grey[600]), // Set title color
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        suffixIcon: Icon(Icons.attach_money,
                            size: 20,
                            color: Colors.grey[600]), // Set icon color
                        labelText: 'Amount',
                        labelStyle: TextStyle(
                            color: Colors.grey[600]), // Set title color
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 12.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    )),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          suffixIcon: Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              size: 20,
                              color: Colors.grey[600]), // Set icon color
                          labelText: 'Account',
                          labelStyle: TextStyle(
                              color: Colors.grey[600]), // Set title color
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 12.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 12),
                Text("Category",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: 8),
                CategoryList(),
                SizedBox(height: 12),
              ],
            )),
      ],
    );
  }
}
