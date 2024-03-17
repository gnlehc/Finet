import 'package:finet/bloc/ecategory/ecategory_bloc.dart';
import 'package:finet/repositories/ecategory_repository.dart';
import 'package:finet/service/ecategory_service.dart';
import 'package:finet/views/widgets/expenses/add_expenses_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AddExpensesPage extends StatelessWidget {
  const AddExpensesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ECategoryBloc(
            eCategoryRepository:
                ECategoryRepository(ecategoryService: ECategoryService())),
        child: Padding(
            padding: EdgeInsets.only(top: 40, right: 20, left: 20),
            child: AddExpensesForm()),
      ),
    );
  }
}
