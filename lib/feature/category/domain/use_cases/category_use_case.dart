import 'package:dartz/dartz.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/error_model.dart';
import '../repositories/category_repository.dart';

final categoryUseCaseProvider = Provider<CategoryUseCase>(
  (ref) => CategoryUseCase(
    ref.watch(categoryRepositoryProvider),
  ),
);

class CategoryUseCase {
  CategoryUseCase(this._categoryRepository);

  final CategoryRepository _categoryRepository;

  Future<Either<ErrorModel, List<String>>> categories() async {
    return await _categoryRepository.categories();
  }
}
