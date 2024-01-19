import 'package:dartz/dartz.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/error_model.dart';
import '../../data/data_sources/category_data_source.dart';
import '../../data/repositories/category_repository_imp.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>(
  (ref) => CategoryRepositoryImpl(
    dataSource: ref.watch(categoryDataSourceProvider),
  ),
);

abstract class CategoryRepository {
  Future<Either<ErrorModel, List<String>>> categories();
}
