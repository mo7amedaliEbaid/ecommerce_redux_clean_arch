import 'package:redux/redux.dart';

import 'product_detail_actions.dart';
import 'product_detail_state.dart';

final Reducer<ProductDetailState> productDetailReducer =
    combineReducers<ProductDetailState>([
  TypedReducer<ProductDetailState, LoadProductDetailRequest>(_onRequest),
  TypedReducer<ProductDetailState, LoadProductDetailSuccess>(_onSuccess),
  TypedReducer<ProductDetailState, LoadProductDetailFailure>(_onFailure),
]);

ProductDetailState _onRequest(
    ProductDetailState state, LoadProductDetailRequest action) {
  return state.copyWith(isLoading: true, error: null);
}

ProductDetailState _onSuccess(
    ProductDetailState state, LoadProductDetailSuccess action) {
  return state.copyWith(isLoading: false, product: action.product);
}

ProductDetailState _onFailure(
    ProductDetailState state, LoadProductDetailFailure action) {
  return state.copyWith(isLoading: false, error: action.message);
}


