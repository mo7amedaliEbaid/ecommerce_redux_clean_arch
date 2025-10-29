import 'package:redux/redux.dart';

import 'products_actions.dart';
import 'products_state.dart';

final Reducer<ProductsState> productsReducer = combineReducers<ProductsState>([
  TypedReducer<ProductsState, LoadProductsRequest>(_onRequest),
  TypedReducer<ProductsState, LoadProductsSuccess>(_onSuccess),
  TypedReducer<ProductsState, LoadProductsFailure>(_onFailure),
]);

ProductsState _onRequest(ProductsState state, LoadProductsRequest action) {
  return state.copyWith(isLoading: true, error: null);
}

ProductsState _onSuccess(ProductsState state, LoadProductsSuccess action) {
  return state.copyWith(products: List.from(action.products), isLoading: false);
}

ProductsState _onFailure(ProductsState state, LoadProductsFailure action) {
  return state.copyWith(isLoading: false, error: action.message);
}


