part of '../pages/products_list_page.dart';

class _CategoryBuilder extends ConsumerWidget {
  const _CategoryBuilder({
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeProvider);
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
              ref.read(selectedCategoryProvider.notifier).state =
                  categories[index];
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: theme.themeMode == ThemeMode.light
                    ? Colors.grey[200]
                    : Colors.amber.shade700,
                border: ref.watch(selectedCategoryProvider) == categories[index]
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
                      color: theme.themeMode == ThemeMode.light
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
