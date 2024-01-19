import 'package:dio/dio.dart';

import '../../../../core/network/rest_client.dart';
import 'category_data_source.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  CategoryDataSourceImpl({
    required this.client,
  });

  final RestClient client;

  @override
  Future<Response> categories() async {
    final response = await client.get(
      APIType.public,
      'products/categories',
    );
    return response;
  }
}
