import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/common/widgets/card.grid.dart';
import 'package:bhutanhub/core/common/widgets/product.card.vertical.dart';
import 'package:bhutanhub/core/common/widgets/section.heading.dart';
import 'package:bhutanhub/core/constants/enums.dart';
import 'package:bhutanhub/core/utils/loading.helper.dart';
import 'package:bhutanhub/src/features/bhutanhub/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
    required this.tabKey,
  });

  final String tabKey;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Future<void> _fetchPopular() async {
    BlocProvider.of<HomeBloc>(context, listen: false).add(
      FetchProductEvent(
        key: widget.tabKey,
        subKey: TabSubKey.popular.toString(),
      ),
    );
  }

  Future<void> _fetchNewArrivals() async {
    BlocProvider.of<HomeBloc>(context, listen: false).add(
      FetchProductEvent(
        key: widget.tabKey,
        subKey: TabSubKey.trending.toString(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchPopular();
    _fetchNewArrivals();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          LoadingHelper.showLoading();
        } else if (state is NewProductsLoaded ||
            state is PopularProductLoaded) {
          LoadingHelper.dismissLoading();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Popular
              Column(
                children: [
                  BHSectionHeading(
                    showActionButton: true,
                    title: 'Popular',
                    onPressed: () => {},
                  ),
                  BHGridLayout(
                    itemCount: state is PopularProductLoaded
                        ? state.products.length > 4
                            ? 4
                            : state.products.length
                        : 0,
                    mainAxisExtent: 330,
                    itemBuilder: (_, idx) {
                      if (state is PopularProductLoaded) {
                        return BHProductCardVertical(
                          product: state.products[idx],
                        );
                      }
                      return const BHProductCardVertical(
                        product: ProductEntity.empty(),
                      );
                    },
                  ),
                ],
              ),

              // New Arrivals
              Column(
                children: [
                  BHSectionHeading(
                    showActionButton: true,
                    title: 'New Arrivals',
                    onPressed: () => {},
                  ),
                  BHGridLayout(
                    itemCount: state is NewProductsLoaded
                        ? state.products.length > 4
                            ? 4
                            : state.products.length
                        : 0,
                    mainAxisExtent: 330,
                    itemBuilder: (_, idx) {
                      if (state is NewProductsLoaded) {
                        return BHProductCardVertical(
                          product: state.products[idx],
                        );
                      }
                      return const BHProductCardVertical(
                        product: ProductEntity.empty(),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
