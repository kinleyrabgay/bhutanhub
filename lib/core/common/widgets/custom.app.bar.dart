import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/utils/devices/device.utility.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      titleSpacing: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 0.5,
          color: BHColors.primary.withOpacity(0.2),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(BHDeviceUtils.getAppBarHeight());
}
