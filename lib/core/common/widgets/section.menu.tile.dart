import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BHSettingMenuTile extends StatelessWidget {
  const BHSettingMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.isLast,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final bool isLast;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: BHColors.white,
          child: InkWell(
            onTap: onTap,
            child: ListTile(
              leading: Icon(
                icon,
                size: 24,
                color: BHColors.primary,
              ),
              title: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                subTitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              trailing: trailing,
              // onTap: onTap,
            ),
          ),
        ),
        if (!isLast)
          Divider(
            height: 0.5,
            thickness: 0.7,
            color: BHColors.primary.withOpacity(0.1),
          )
      ],
    );
  }
}
