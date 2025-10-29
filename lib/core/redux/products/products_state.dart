import 'package:equatable/equatable.dart';
import 'package:ecommerece_redux/feature/product/root/data/models/product_model.dart';

class ProductsState extends Equatable {
  const ProductsState({
    required this.products,
    required this.isLoading,
    required this.error,
  });

  final List<ProductModel> products;
  final bool isLoading;
  final String? error;

  factory ProductsState.initial() => const ProductsState(
        products: [],
        isLoading: false,
        error: null,
      );

  ProductsState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
    String? error,
  }) {
    return ProductsState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [products, isLoading, error];
}


