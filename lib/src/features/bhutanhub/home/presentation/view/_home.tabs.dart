import 'package:bhutanhub/core/common/widgets/card.grid.dart';
import 'package:bhutanhub/core/common/widgets/product.card.vertical.dart';
import 'package:bhutanhub/core/common/widgets/product.loader.dart';
import 'package:bhutanhub/core/common/widgets/section.heading.dart';
import 'package:bhutanhub/core/constants/tab.keys.dart';
import 'package:bhutanhub/core/utils/loading.helper.dart';
import 'package:bhutanhub/src/features/bhutanhub/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({
    super.key,
    required this.tabKey,
  });

  final String tabKey;

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  bool _hasFetchedPopular = false;
  bool _hasFetchedNewArrivals = false;
  bool _hasFetchedTrending = false;

  Future<void> _fetchBanner() async {}

  /// Fetch popular products
  Future<void> _fetchPopular() async {
    if (!_hasFetchedPopular) {
      BlocProvider.of<HomeBloc>(context, listen: false).add(
        FetchProductEvent(
          key: widget.tabKey,
          subKey: TabSubKey.popular,
        ),
      );
      _hasFetchedPopular = true;
    }
  }

  /// Fetch new arrival products
  Future<void> _fetchNewArrivals() async {
    if (!_hasFetchedNewArrivals) {
      BlocProvider.of<HomeBloc>(context, listen: false).add(
        FetchProductEvent(
          key: widget.tabKey,
          subKey: TabSubKey.newArrivals,
        ),
      );
      _hasFetchedNewArrivals = true;
    }
  }

  /// Fetch trending products
  Future<void> _fetchTrending() async {
    if (!_hasFetchedTrending) {
      BlocProvider.of<HomeBloc>(context, listen: false).add(
        FetchProductEvent(
          key: widget.tabKey,
          subKey: TabSubKey.trending,
        ),
      );
      _hasFetchedTrending = true;
    }
  }

  @override
  void initState() {
    super.initState();
    _hasFetchedPopular = false;
    _hasFetchedNewArrivals = false;
    _hasFetchedTrending = false;
    _fetchPopular();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded) {
          if (state.popularProducts.isNotEmpty && !_hasFetchedNewArrivals) {
            _fetchNewArrivals();
          } else if (state.newProducts.isNotEmpty && !_hasFetchedTrending) {
            _fetchTrending();
          }
          LoadingHelper.dismissLoading();
        }
      },
      builder: (context, state) {
        if (state is HomeLoaded) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner
                if (widget.tabKey == 'view_all') ...[
                  Text('BANNER'),
                ],

                Text('BANNER'),

                // Popular
                Column(
                  children: [
                    if (state.popularProducts.isEmpty) ...[
                      const ProductLoader(),
                    ] else ...[
                      BHSectionHeading(
                        showActionButton: true,
                        showMoreAction: false,
                        title: 'Popular',
                        onPressed: () => {},
                      ),
                      BHGridLayout(
                        itemCount: state.popularProducts.length,
                        mainAxisExtent: 330,
                        itemBuilder: (_, idx) {
                          return BHProductCardVertical(
                            product: state.popularProducts[idx],
                          );
                        },
                      ),
                    ],
                  ],
                ),

                // New Arrivals
                if (_hasFetchedPopular) ...[
                  Column(
                    children: [
                      if (state.newProducts.isEmpty) ...[
                        const ProductLoader(),
                      ] else ...[
                        BHSectionHeading(
                          showActionButton: true,
                          title: 'New Arrivals',
                          onPressed: () => {},
                        ),
                        BHGridLayout(
                          itemCount: state.newProducts.length,
                          mainAxisExtent: 330,
                          itemBuilder: (_, idx) {
                            return BHProductCardVertical(
                              product: state.newProducts[idx],
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ],

                if (_hasFetchedNewArrivals) ...[
                  // New Arrivals
                  Column(
                    children: [
                      if (state.trendings.isEmpty) ...[
                        const ProductLoader(),
                      ] else ...[
                        BHSectionHeading(
                          showActionButton: true,
                          title: 'Trendings',
                          onPressed: () => {},
                        ),
                        BHGridLayout(
                          itemCount: state.trendings.length,
                          mainAxisExtent: 330,
                          itemBuilder: (_, idx) {
                            return BHProductCardVertical(
                              product: state.trendings[idx],
                            );
                          },
                        ),
                      ]
                    ],
                  ),
                ]
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            child: ProductLoader(
              showBannerLoader: widget.tabKey == 'view_all',
            ),
          );
        }
      },
    );
  }
}
