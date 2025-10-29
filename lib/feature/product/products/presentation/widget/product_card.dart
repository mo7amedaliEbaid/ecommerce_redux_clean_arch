part of '../pages/products_list_page.dart';

class _ProductCard extends StatelessWidget {
  const _ProductCard({Key? key, required this.data}) : super(key: key);

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _navigateToProductDetailsPage(context, data.id);
      },
      leading: Image.network(
        data.image,
        fit: BoxFit.contain,
        height: 100,
        width: 100,
      ),
      title: Text(data.title),
      subtitle: Text("\$${data.price}"),
    );
  }

  void _navigateToProductDetailsPage(
    BuildContext context,
    int id,
  ) {
    context.goNamed(
      Routes.productDetails.name,
      queryParameters: <String, String>{
        'id': id.toString(),
      },
    );
  }
}
