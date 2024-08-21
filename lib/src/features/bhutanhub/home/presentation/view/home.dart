import 'package:bhutanhub/core/common/widgets/cart.dart';
import 'package:bhutanhub/core/constants/tabs.dart';
import 'package:bhutanhub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/src/features/bhutanhub/home/presentation/view/_home.tabs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Tabs> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = tabs;
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      // if (_tabController.previousIndex == _tabController.index) {
      //   LoadingHelper.showLoading();
      // }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is Authenticated) {
          print('${state.user}');
        }
      },
      child: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: _tabs
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
            padding:
                const EdgeInsets.symmetric(horizontal: BHSizes.defaultSpace),
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: _tabs.map((tab) => HomeTabs(tabKey: tab.key)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
