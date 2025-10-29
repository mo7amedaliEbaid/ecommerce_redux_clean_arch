import 'package:dartz/dartz.dart';
import '../../../../../core/network/error_model.dart';
import '../../../root/data/models/product_model.dart';
import '../../../root/domain/repositories/product_repository.dart';

class ProductsUseCase {
  ProductsUseCase(this._repository);

  final ProductRepository _repository;

  Future<Either<ErrorModel, List<ProductModel>>> productList() async {
    return await _repository.productList();
  }
}
