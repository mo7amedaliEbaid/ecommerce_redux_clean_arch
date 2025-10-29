import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/routers.dart';
import '../../../../../core/redux/app_state.dart';
import '../../../../../core/redux/theme/theme_actions.dart';
import '../../../../category/presentation/widgets/category_loading_shimmer.dart';
import '../../../root/data/models/product_model.dart';
import '../widget/products_loading_shimmer.dart';
import '../../../../../core/redux/categories/categories_actions.dart';
import '../../../../../core/redux/products/products_actions.dart';
import '../../../../../core/redux/app_state.dart';

part '../widget/category_builder.dart';

part '../widget/product_card.dart';

part '../widget/product_list_builder.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final store = StoreProvider.of<AppState>(context, listen: false);
      store.dispatch(fetchCategories());
      store.dispatch(fetchProducts());
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = StoreProvider.of<AppState>(context).state.themeState.mode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () => StoreProvider.of<AppState>(context).dispatch(ToggleThemeAction()),
            icon: Icon(themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
          ),
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.login.name);
            },
            icon: const Icon(
              Icons.login,
            ),
          )
        ],
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        distinct: true,
        builder: (context, state) {
          final productsState = state.productsState;
          final categoriesState = state.categoriesState;
          return Column(
            children: [
              /// Categories
              _buildCategories(categoriesState),

              /// Product List
              _buildProducts(productsState, categoriesState),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCategories(final categoriesState) {
    if (categoriesState.isLoading) {
      return const CategoryLoadingShimmer();
    }
    if (categoriesState.error != null) {
      return const Center(child: Text('Error'));
    }
    return _CategoryBuilder(categories: categoriesState.categories);
  }

  Widget _buildProducts(final productsState, final categoriesState) {
    if (productsState.isLoading) {
      return const Expanded(child: ProductsLoadingShimmer());
    }
    if (productsState.error != null) {
      return const Center(child: Text('Error'));
    }
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          StoreProvider.of<AppState>(context).dispatch(fetchProducts());
        },
        child: _ProductListBuilder(
          products: _filterProducts(
            productsState.products,
            categoriesState.selected,
          ),
        ),
      ),
    );
  }

  List<ProductModel> _filterProducts(
    List<ProductModel> products,
    String selected,
  ) {
    if (selected.isEmpty) return products;
    final lower = selected.toLowerCase();
    final filtered = products
        .where((element) => element.category == lower)
        .toList();
    return filtered.isEmpty ? products : filtered;
  }
}
