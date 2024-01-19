import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network.dart';
import 'category_data_source_imp.dart';

final categoryDataSourceProvider = Provider<CategoryDataSource>(
  (ref) => CategoryDataSourceImpl(
    client: ref.watch(dioProvider),
  ),
);

abstract class CategoryDataSource {
  Future<Response> categories();
}
