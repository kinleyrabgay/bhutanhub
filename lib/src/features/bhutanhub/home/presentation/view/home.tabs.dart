import 'package:bhutanhub/core/common/widgets/cart.dart';
import 'package:bhutanhub/src/features/bhutanhub/home/domain/entities/tab.entity.dart';
import 'package:flutter/material.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/src/features/bhutanhub/home/presentation/widgets/home.dart';
import 'package:iconsax/iconsax.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String tabKey = "view_all";

  // List of TabEntity objects
  final List<TabEntity> tabs = [
    const TabEntity(name: "VIEW ALL", key: "view_all"),
    const TabEntity(name: "DRESSES", key: "dresses"),
    const TabEntity(name: "JACKETS", key: "jackets"),
    const TabEntity(name: "ELECTRONICS", key: "electronics"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          tabKey = tabs[_tabController.index].key;
        });
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
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs
                .map(
                  (tab) => Tab(
                    child: Text(
                      tab.name,
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
            // physics: const NeverScrollableScrollPhysics(),
          ),
          automaticallyImplyLeading: false,
          title: Text(
            'BhutanHub',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            BHCart(
              iconColor: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Iconsax.notification),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: BHSizes.defaultSpace),
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: tabs.map((tab) => HomeTab(tabKey: tabKey)).toList(),
          ),
        ),
      ),
    );
  }
}
