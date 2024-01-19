import 'package:dartz/dartz.dart';
import 'package:ecommerece_riverpod/core/network/request_handler.dart';

import '../../../../core/network/error_model.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_data_source.dart';
import '../models/category_model.dart';


class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.dataSource,
  });

  final CategoryDataSource dataSource;

  @override
  Future<Either<ErrorModel, List<String>>> categories() async {
    return await dataSource.categories().guard((data) {
      return categoryModelFromJson(data);
    });
  }
}
