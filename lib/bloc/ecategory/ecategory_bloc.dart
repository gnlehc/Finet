import 'package:finet/bloc/ecategory/ecategory_event.dart';
import 'package:finet/bloc/ecategory/ecategory_state.dart';
import 'package:finet/repositories/ecategory_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ECategoryBloc extends Bloc<FetchCategoriesEvent, ECategoryState> {
  final ECategoryRepository eCategoryRepository;
  ECategoryBloc({required this.eCategoryRepository}) : super(CategoriesInitial()) {
    on<FetchCategoriesEvent>((event, emit) async {
      try {
        emit(CategoriesLoading());
        final categories = await eCategoryRepository.getCategories();
        emit(CategoriesLoaded(categories));
      } catch (e) {
        emit(CategoriesError());
      }
    });
  }
}