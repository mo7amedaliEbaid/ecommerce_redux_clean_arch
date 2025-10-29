import 'package:dartz/dartz.dart';
import '../../../../core/network/error_model.dart';
import '../repositories/category_repository.dart';

class CategoryUseCase {
  CategoryUseCase(this._categoryRepository);

  final CategoryRepository _categoryRepository;

  Future<Either<ErrorModel, List<String>>> categories() async {
    return await _categoryRepository.categories();
  }
}
