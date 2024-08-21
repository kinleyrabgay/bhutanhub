import 'dart:async';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/images.dart';
import 'package:bhutanhub/core/constants/navigation.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/providers/user.provider.dart';
import 'package:bhutanhub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'index.dart';

class BhutanhubNavigation extends StatefulWidget {
  const BhutanhubNavigation({super.key});

  static const routeName = '/bottom-navigation';

  @override
  State<BhutanhubNavigation> createState() => _BhutanhubNavigationState();
}

class _BhutanhubNavigationState extends State<BhutanhubNavigation> {
  int _selectedIndex = 0;
  bool isConnectedToInternet = true;
  StreamSubscription? _internetConnectionStreamSubscription;
  late List<Navigations> _navigations;
  String? profileImageUrl;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    ServiceView(),
    SearchView(),
    PersonalizationView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _navigations = navigations;

    // Listen for connectivity changes
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          setState(() {
            isConnectedToInternet = true;
          });
          break;
        case InternetStatus.disconnected:
          setState(() {
            isConnectedToInternet = false;
          });
          break;
        default:
          setState(() {
            isConnectedToInternet = false;
          });
          break;
      }
    });
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isConnectedToInternet) {
      return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.read<UserProvider>().initUser(state.user);
            setState(() {
              profileImageUrl = state.user.avatar;
            });
          }
        },
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: _navigations.map((item) {
              int index = _navigations.indexOf(item);
              return BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(6),
                  child: index == 3
                      ? Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _selectedIndex == index
                                  ? BHColors.primary
                                  : Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              profileImageUrl ?? BHImages.defaultPlaceholder,
                            ),
                            radius: 12,
                          ),
                        )
                      : Icon(
                          item.icon,
                          size: 24,
                        ),
                ),
                label: item.label,
              );
            }).toList(),
            elevation: 1,
            backgroundColor: BHColors.white,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            enableFeedback: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            unselectedItemColor: BHColors.primary.withOpacity(0.15),
            selectedItemColor: BHColors.primary,
            onTap: _onItemTapped,
          ),
        ),
      );
    }
    if (!isConnectedToInternet) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(BHSizes.defaultSpace),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  BHImages.noInternet,
                  height: 100,
                ),
                const SizedBox(height: BHSizes.spaceSections),
                Text(
                  'We need internet connection to work properly, please turn on your internet connection and try again!',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: BHColors.primary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
