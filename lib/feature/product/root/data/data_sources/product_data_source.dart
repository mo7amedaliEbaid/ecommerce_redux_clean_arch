import 'package:dio/dio.dart';

abstract class ProductDataSource {
  Future<Response> fetchProductList();

  Future<Response> fetchProduct(int id);
}
