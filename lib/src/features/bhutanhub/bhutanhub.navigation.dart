import 'package:bhutanhub/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'index.dart';

class BhutanhubNavigation extends StatefulWidget {
  const BhutanhubNavigation({super.key});

  static const routeName = '/bottom-navigation';

  @override
  State<BhutanhubNavigation> createState() => _BhutanhubNavigationState();
}

class _BhutanhubNavigationState extends State<BhutanhubNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ExploreView(),
    ServiceView(),
    SearchView(),
    PersonalizationView(),
  ];

  final String profileImageUrl =
      'https://w0.peakpx.com/wallpaper/454/815/HD-wallpaper-naruto-art-fictional-character.jpg'; // Replace with your profile image URL or asset path

  final List<Map<String, dynamic>> _navItems = [
    {
      'label': 'Home',
      'icon': Iconsax.home,
      'activeIcon': Iconsax.global,
    },
    {
      'label': 'Service',
      'icon': Iconsax.magicpen,
      'activeIcon': Iconsax.category5,
    },
    {
      'label': 'Search',
      'icon': Iconsax.search_normal,
      'activeIcon': Iconsax.add_square5,
    },
    {
      'label': 'Profile',
      'icon': Iconsax.user,
      'activeIcon': Iconsax.user5,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navItems.map((item) {
          int index = _navItems.indexOf(item);
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
                          profileImageUrl,
                        ),
                        radius: 12,
                      ),
                    )
                  : Icon(
                      item['icon'],
                      size: 24,
                    ),
            ),
            label: item['label'],
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
    );
  }
}
