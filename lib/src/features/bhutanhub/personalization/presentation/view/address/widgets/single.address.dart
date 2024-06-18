import 'package:bhutan_hub/core/common/widgets/rounded.container.dart';
import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:bhutan_hub/core/utils/helpers/helper.function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BHSingleAddress extends StatelessWidget {
  const BHSingleAddress({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final isDark = BHHelperFunctions.isDarkMode(context);
    return BHRoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(BHSizes.pMd),
      showBorder: true,
      backgroundColor: selectedAddress
          ? BHColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDark
              ? BHColors.darkerGrey
              : BHColors.grey,
      margin: const EdgeInsets.only(bottom: BHSizes.spaceItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? isDark
                      ? BHColors.light
                      : BHColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: BHSizes.pSm / 2),
              const Text(
                '(+975) 77 20 49 70',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: BHSizes.pSm / 2),
              const Text(
                '82356 Timmy Caves, South Liana, Maine, 87665, USA',
                maxLines: 2,
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
