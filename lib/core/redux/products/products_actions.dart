import 'package:redux_thunk/redux_thunk.dart';

import '../../di/di.dart' as di;
import '../app_state.dart';
import 'products_state.dart';

class LoadProductsRequest {}

class LoadProductsSuccess {
  LoadProductsSuccess(this.products);
  final List products;
}

class LoadProductsFailure {
  LoadProductsFailure(this.message);
  final String message;
}

ThunkAction<AppState> fetchProducts() {
  return (store) async {
    store.dispatch(LoadProductsRequest());
    final result = await di.productsUseCase.productList();
    result.fold(
      (l) => store.dispatch(LoadProductsFailure(l.toString())),
      (r) => store.dispatch(LoadProductsSuccess(r)),
    );
  };
}


