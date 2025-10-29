import 'package:ecommerece_redux/feature/product/root/data/models/product_model.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../di/di.dart' as di;
import '../app_state.dart';

class LoadProductDetailRequest {
  LoadProductDetailRequest(this.id);
  final int id;
}

class LoadProductDetailSuccess {
  LoadProductDetailSuccess(this.product);
  final ProductModel product;
}

class LoadProductDetailFailure {
  LoadProductDetailFailure(this.message);
  final String message;
}

ThunkAction<AppState> fetchProductDetail(int id) {
  return (store) async {
    store.dispatch(LoadProductDetailRequest(id));
    final result = await di.productDetailsUse.product(id);
    result.fold(
      (l) => store.dispatch(LoadProductDetailFailure(l.toString())),
      (r) => store.dispatch(LoadProductDetailSuccess(r)),
    );
  };
}


