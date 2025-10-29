import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'app_state.dart';
import 'theme/theme_reducer.dart';
import 'categories/categories_reducer.dart';
import 'products/products_reducer.dart';
import 'product_detail/product_detail_reducer.dart';

Store<AppState> createAppStore() {
  return Store<AppState>(
    (state, action) => state.copyWith(
      themeState: themeReducer(state.themeState, action),
      categoriesState: categoriesReducer(state.categoriesState, action),
      productsState: productsReducer(state.productsState, action),
      productDetailState:
          productDetailReducer(state.productDetailState, action),
    ),
    initialState: AppState.initial(),
    middleware: [thunkMiddleware],
  );
}


