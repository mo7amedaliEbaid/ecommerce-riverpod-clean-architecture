import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/routers.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../../core/theme/theme_provider.dart';
import '../../../../category/presentation/provider/category_list_provider.dart';
import '../../../../category/presentation/widgets/category_loading_shimmer.dart';
import '../../../root/data/models/product_model.dart';
import '../riverpod/providers.dart';
import '../widget/products_loading_shimmer.dart';

part '../widget/category_builder.dart';

part '../widget/product_card.dart';

part '../widget/product_list_builder.dart';

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(productsProvider.notifier).productList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productsProvider);
    final categoriesState = ref.watch(categoriesProvider);
    final theme = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
            icon: Icon(theme.themeMode == ThemeMode.light
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
      body: Column(
        children: [
          /// Categories
          categoriesState.when(
            data: (categories) {
              return _CategoryBuilder(categories: categories);
            },
            loading: () => const CategoryLoadingShimmer(),
            error: (error, stackTrace) {
              log(
                "ProductListPage.categoriesState.when",
                error: error.toString(),
                stackTrace: stackTrace,
              );
              return const Center(child: Text('Error'));
            },
          ),

          /// Product List
          state is LoadingState
              ? const Expanded(child: ProductsLoadingShimmer())
              : state is SuccessState<List<ProductModel>>
                  ? Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          ref.invalidate(selectedCategoryProvider);
                          await ref
                              .read(productsProvider.notifier)
                              .productList();
                        },
                        child: _ProductListBuilder(products: state.data!),
                      ),
                    )
                  : const Center(child: Text('Error')),
        ],
      ),
    );
  }
}
