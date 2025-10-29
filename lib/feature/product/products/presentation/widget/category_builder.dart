part of '../pages/products_list_page.dart';

class _CategoryBuilder extends StatelessWidget {
  const _CategoryBuilder({
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final themeMode = StoreProvider.of<AppState>(context).state.themeState.mode;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ).copyWith(left: 16),
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              StoreProvider.of<AppState>(context)
                  .dispatch(SelectCategoryAction(categories[index]));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: themeMode == ThemeMode.light
                    ? Colors.grey[200]
                    : Colors.amber.shade700,
                border: StoreProvider.of<AppState>(context)
                            .state
                            .categoriesState
                            .selected ==
                        categories[index]
                    ? Border.all(
                        color: Colors.blue,
                      )
                    : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  categories[index].toUpperCase(),
                  style: TextStyle(
                      color: themeMode == ThemeMode.light
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }
}
