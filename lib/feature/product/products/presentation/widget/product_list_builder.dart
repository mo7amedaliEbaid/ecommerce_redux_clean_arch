part of '../pages/products_list_page.dart';

class _ProductListBuilder extends StatelessWidget {
  const _ProductListBuilder({
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _ProductCard(data: products[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
