import 'package:equatable/equatable.dart';
import 'package:ecommerece_riverpod/feature/product/root/data/models/product_model.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    required this.isLoading,
    required this.product,
    required this.error,
  });

  final bool isLoading;
  final ProductModel? product;
  final String? error;

  factory ProductDetailState.initial() => const ProductDetailState(
        isLoading: false,
        product: null,
        error: null,
      );

  ProductDetailState copyWith({
    bool? isLoading,
    ProductModel? product,
    String? error,
  }) {
    return ProductDetailState(
      isLoading: isLoading ?? this.isLoading,
      product: product ?? this.product,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, product, error];
}


