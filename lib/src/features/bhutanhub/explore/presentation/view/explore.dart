import 'package:bhutanhub/core/common/widgets/cart.dart';
import 'package:flutter/material.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/src/features/bhutanhub/explore/presentation/view/widgets/explore.tab.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:iconsax/iconsax.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabTitles = [
    "VIEW ALL",
    "SERVICES",
    "DRESSES",
    "JACKETS",
    "ELECTRONICS",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabTitles.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        // This block is executed during a drag (index is changing)
        print('Dragging to ${tabTitles[_tabController.index]}');
        EasyLoading.show(
          indicator: const CircularProgressIndicator(
            backgroundColor: BHColors.primary,
            color: BHColors.white,
          ),
          maskType: EasyLoadingMaskType.clear,
          dismissOnTap: true,
        );
      } else if (_tabController.index != _tabController.previousIndex) {
        // This block is executed after the tab index has changed
        print('Switched to ${tabTitles[_tabController.index]}');
        EasyLoading.dismiss();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: tabTitles
                .map(
                  (title) => Tab(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                )
                .toList(),
            dividerHeight: 0.1,
            automaticIndicatorColorAdjustment: true,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: BHColors.primary,
            dividerColor: BHColors.primary.withOpacity(0.3),
            indicatorPadding: EdgeInsets.zero,
            onTap: (value) => {},
          ),
          automaticallyImplyLeading: false,
          title: Text(
            'BhutanHub',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            IconButton(
              icon: const Icon(Iconsax.notification),
              onPressed: () {},
            ),
            BHCart(
              iconColor: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Iconsax.search_normal),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: BHSizes.defaultSpace),
          child: TabBarView(
            controller: _tabController,
            children: tabTitles
                .map(
                  (title) => ExploreTab(
                    title: title,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
