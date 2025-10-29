import 'package:dartz/dartz.dart';
import '../../../../../core/network/error_model.dart';
import '../../data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<ErrorModel, List<ProductModel>>> productList();

  Future<Either<ErrorModel, ProductModel>> product(int id);
}
