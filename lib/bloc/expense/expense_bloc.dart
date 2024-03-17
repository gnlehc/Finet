import 'package:finet/bloc/expense/expense_event.dart';
import 'package:finet/bloc/expense/expense_state.dart';
import 'package:finet/repositories/expense_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final ExpenseRepository expenseRepository;

  ExpensesBloc({required this.expenseRepository}) : super(ExpensesInitial());

  @override
  Stream<ExpensesState> mapEventToState(ExpensesEvent event) async* {
    if (event is AddExpenseEvent) {
      yield ExpensesLoading();
      try {
        await expenseRepository.addExpense(event.expense);
        yield ExpenseAdded();
      } catch (e) {
        yield ExpensesFailure(e.toString());
      }
    } 
  }
}