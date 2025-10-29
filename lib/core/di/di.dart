import 'package:ecommerece_redux/core/network/network.dart';
import 'package:ecommerece_redux/feature/category/data/data_sources/category_data_source_imp.dart';
import 'package:ecommerece_redux/feature/category/data/repositories/category_repository_imp.dart';
import 'package:ecommerece_redux/feature/category/domain/use_cases/category_use_case.dart';
import 'package:ecommerece_redux/feature/product/root/data/data_sources/product_data_source_imp.dart';
import 'package:ecommerece_redux/feature/product/root/data/repositories/product_repository_imp.dart';
import 'package:ecommerece_redux/feature/product/details/domain/use_cases/product_details_use_case.dart';
import 'package:ecommerece_redux/feature/product/products/domain/use_cases/products_use_case.dart';

// Network client singleton
final client = appRestClient;

// Category DI
final categoryDataSource = CategoryDataSourceImpl(client: client);
final categoryRepository = CategoryRepositoryImpl(dataSource: categoryDataSource);
final categoryUseCase = CategoryUseCase(categoryRepository);

// Product DI
final productDataSource = ProductDataSourceImpl(client: client);
final productRepository = ProductRepositoryImpl(dataSource: productDataSource);
final productsUseCase = ProductsUseCase(productRepository);
final productDetailsUse = ProductDetailsUseCase(productRepository);


