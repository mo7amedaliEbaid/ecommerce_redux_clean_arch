import 'package:dartz/dartz.dart';
import '../../../../core/network/error_model.dart';

abstract class CategoryRepository {
  Future<Either<ErrorModel, List<String>>> categories();
}
