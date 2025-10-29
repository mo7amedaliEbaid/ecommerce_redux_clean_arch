import 'package:equatable/equatable.dart';
import 'theme/theme_state.dart';
import 'categories/categories_state.dart';
import 'products/products_state.dart';
import 'product_detail/product_detail_state.dart';

class AppState extends Equatable {
  const AppState({
    required this.themeState,
    required this.categoriesState,
    required this.productsState,
    required this.productDetailState,
  });

  final ThemeState themeState;
  final CategoriesState categoriesState;
  final ProductsState productsState;
  final ProductDetailState productDetailState;

  AppState copyWith({
    ThemeState? themeState,
    CategoriesState? categoriesState,
    ProductsState? productsState,
    ProductDetailState? productDetailState,
  }) {
    return AppState(
      themeState: themeState ?? this.themeState,
      categoriesState: categoriesState ?? this.categoriesState,
      productsState: productsState ?? this.productsState,
      productDetailState: productDetailState ?? this.productDetailState,
    );
  }

  static AppState initial() => AppState(
        themeState: ThemeState.initial(),
        categoriesState: CategoriesState.initial(),
        productsState: ProductsState.initial(),
        productDetailState: ProductDetailState.initial(),
      );

  @override
  List<Object?> get props => [
        themeState,
        categoriesState,
        productsState,
        productDetailState,
      ];
}


