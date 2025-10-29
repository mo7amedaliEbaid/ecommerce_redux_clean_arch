
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../root/data/models/product_model.dart';
import '../widgets/product_details_loading_shimmer.dart';
import '../../../../../core/redux/app_state.dart';
import '../../../../../core/redux/product_detail/product_detail_actions.dart';
import '../../../../../core/redux/product_detail/product_detail_state.dart';

part '../widgets/product_details_builder.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final int productId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductDetailState>(
      onInit: (store) => store.dispatch(fetchProductDetail(productId)),
      converter: (store) => store.state.productDetailState,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Product Details'),
          ),
          body: state.isLoading
              ? const ProductDetailsLoadingShimmer()
              : state.error != null
                  ? const Center(child: Text('Error'))
                  : _ProductDetailsBuilder(product: state.product!),
        );
      },
      distinct: true,
    );
  }
}
