import 'package:redux/redux.dart';

import 'categories_actions.dart';
import 'categories_state.dart';

final Reducer<CategoriesState> categoriesReducer =
    combineReducers<CategoriesState>([
  TypedReducer<CategoriesState, LoadCategoriesRequest>(_onRequest),
  TypedReducer<CategoriesState, LoadCategoriesSuccess>(_onSuccess),
  TypedReducer<CategoriesState, LoadCategoriesFailure>(_onFailure),
  TypedReducer<CategoriesState, SelectCategoryAction>(_onSelect),
]);

CategoriesState _onRequest(CategoriesState state, LoadCategoriesRequest action) {
  return state.copyWith(isLoading: true, error: null);
}

CategoriesState _onSuccess(
    CategoriesState state, LoadCategoriesSuccess action) {
  return state.copyWith(categories: action.categories, isLoading: false);
}

CategoriesState _onFailure(
    CategoriesState state, LoadCategoriesFailure action) {
  return state.copyWith(isLoading: false, error: action.message);
}

CategoriesState _onSelect(
    CategoriesState state, SelectCategoryAction action) {
  return state.copyWith(selected: action.category);
}


