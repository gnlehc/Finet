import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:finet/model/ecategory_model.dart';

class ECategoryService {
  Future<List<ECategory>> getCategories() async {
    // pake dio package
    try {
      final response = await http.get(Uri.parse('https://10.0.2.2:7002/api/getListExpenseCategory'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final categories = (data['data'] as List)
            .map((category) => ECategory.fromJson(category))
            .toList();
        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Failed to load categories: $e');
      return []; // Return an empty list as a fallback
    }
  }
}