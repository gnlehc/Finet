import 'package:finet/model/expense_model.dart';

abstract class ExpensesState {}

class ExpensesInitial extends ExpensesState {}

class ExpensesLoading extends ExpensesState {}

class ExpensesLoaded extends ExpensesState {
  final List<Expense> expenses;

  ExpensesLoaded(this.expenses);
}

class ExpenseAdded extends ExpensesState {}

class ExpenseDeleted extends ExpensesState {}

class ExpenseUpdated extends ExpensesState {}

class ExpensesFailure extends ExpensesState {
  final String error;

  ExpensesFailure(this.error);
}