import 'package:dartz/dartz.dart';
import '../../../../../core/network/error_model.dart';
import '../../../root/data/models/product_model.dart';
import '../../../root/domain/repositories/product_repository.dart';

class ProductDetailsUseCase {
  ProductDetailsUseCase(this._repository);

  final ProductRepository _repository;

  Future<Either<ErrorModel, ProductModel>> product(int id) async {
    return await _repository.product(id);
  }
}
