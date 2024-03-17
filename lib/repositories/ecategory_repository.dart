import 'package:finet/model/ecategory_model.dart';
import 'package:finet/service/ecategory_service.dart';

class ECategoryRepository {
  final ECategoryService ecategoryService;

  ECategoryRepository({required this.ecategoryService});

  Future<List<ECategory>> getCategories() async {
    return await ecategoryService.getCategories();
  }
}