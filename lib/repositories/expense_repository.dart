import 'package:finet/model/expense_model.dart';
import 'package:finet/service/expense_service.dart';

class ExpenseRepository {
  final ExpenseService expenseService;

  ExpenseRepository({required this.expenseService});

  Future<void> addExpense(Expense expense) async {
    return await expenseService.addExpense(expense);
  }
}