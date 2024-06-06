import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:bhutan_hub/core/constants/images.dart';
import 'package:bhutan_hub/core/models/rive.model.dart';
import 'package:flutter/material.dart';

class NavItemModel {
  final int index;
  final String title;
  final Color color;
  final RiveModel rive;

  NavItemModel({
    required this.color,
    required this.index,
    required this.title,
    required this.rive,
  });
}

List<NavItemModel> bottomNavItem = [
  NavItemModel(
    index: 0,
    title: 'Home',
    color: BHColors.buttonPrimary,
    rive: RiveModel(
      src: BHImages.riveIcons2,
      artboard: 'HOME',
      stateMachineName: 'HOME_Interactivity',
    ),
  ),
  NavItemModel(
    index: 1,
    title: 'Sell',
    color: BHColors.buttonPrimary,
    rive: RiveModel(
      src: BHImages.riveIcons2,
      artboard: 'SELL',
      stateMachineName: 'SELL_Interactivity',
    ),
  ),
  NavItemModel(
    index: 2,
    title: 'Favourite',
    color: BHColors.heartColor,
    rive: RiveModel(
      src: BHImages.riveIcons2,
      artboard: 'FAVOURITE',
      stateMachineName: 'FAVOURITE_Interactivity',
    ),
  ),
  NavItemModel(
    index: 3,
    title: 'Profile',
    color: BHColors.buttonPrimary,
    rive: RiveModel(
      src: BHImages.riveIcons2,
      artboard: 'USER',
      stateMachineName: 'USER_Interactivity',
    ),
  ),
];


// List<NavItemModel> bottomNavItem = [
//   NavItemModel(
//     title: 'Chat',
//     rive: RiveModel(
//       src: BHImages.riveIcons,
//       artboard: 'CHAT',
//       stateMachineName: 'CHAT_Interactivity',
//     ),
//   ),
//   NavItemModel(
//     title: 'Search',
//     rive: RiveModel(
//       src: BHImages.riveIcons,
//       artboard: 'SEARCH',
//       stateMachineName: 'SEARCH_Interactivity',
//     ),
//   ),
//   NavItemModel(
//     title: 'Timer',
//     rive: RiveModel(
//       src: BHImages.riveIcons,
//       artboard: 'TIMER',
//       stateMachineName: 'TIMER_Interactivity',
//     ),
//   ),
//   NavItemModel(
//     title: 'Notification',
//     rive: RiveModel(
//       src: BHImages.riveIcons,
//       artboard: 'BELL',
//       stateMachineName: 'BELL_Interactivity',
//     ),
//   ),
//   NavItemModel(
//     title: 'Profile',
//     rive: RiveModel(
//       src: BHImages.riveIcons,
//       artboard: 'USER',
//       stateMachineName: 'USER_Interactivity',
//     ),
//   ),
// ];
