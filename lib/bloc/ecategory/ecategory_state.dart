import 'package:finet/model/ecategory_model.dart';

abstract class ECategoryState {}

class CategoriesInitial extends ECategoryState {}

class CategoriesLoading extends ECategoryState {}

class CategoriesLoaded extends ECategoryState {
  final List<ECategory> categories;

  CategoriesLoaded(this.categories);
}

class CategoriesFailure extends ECategoryState {
  final String error;

  CategoriesFailure(this.error);
}

class CategoriesError extends ECategoryState {}