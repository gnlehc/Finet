import 'package:finet/model/expense_model.dart';

abstract class ExpensesEvent {}

class AddExpenseEvent extends ExpensesEvent {
  final Expense expense;

  AddExpenseEvent(this.expense);
}

class GetExpensesEvent extends ExpensesEvent {}

class DeleteExpenseEvent extends ExpensesEvent {
  final int id;

  DeleteExpenseEvent(this.id);
}

class UpdateExpenseEvent extends ExpensesEvent {
  final Expense expense;

  UpdateExpenseEvent(this.expense);
}