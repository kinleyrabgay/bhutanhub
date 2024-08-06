import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.data,
    this.onProductTap,
  });

  final List<Map<String, dynamic>> data;
  final Function(Map<String, dynamic>)? onProductTap;

  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 1,
      paddingListHorizontal: BHSizes.defaultSpace,
      paddingListBottom: BHSizes.defaultSpace,
      paddingListTop: BHSizes.defaultSpace,
      headerBorderColor: BHColors.white,
      headerBackgroundColor: BHColors.white,
      headerBorderRadius: BHSizes.brXs,
      headerPadding: const EdgeInsets.all(BHSizes.pMd),
      contentBorderRadius: BHSizes.brXs,
      contentBackgroundColor: BHColors.white,
      contentBorderColor: BHColors.white,
      contentHorizontalPadding: BHSizes.pMd,
      contentVerticalPadding: BHSizes.pSm,
      flipLeftIconIfOpen: true,
      flipRightIconIfOpen: true,
      openAndCloseAnimation: Accordion.sectionScaleAnimation,
      rightIcon: Icon(
        Icons.keyboard_arrow_down,
        color: BHColors.primary.withOpacity(0.8),
        size: 24,
      ),
      sectionOpeningHapticFeedback: SectionHapticFeedback.light,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      paddingBetweenOpenSections: BHSizes.defaultSpace,
      paddingBetweenClosedSections: BHSizes.defaultSpace,
      children: [
        ...data.map(
          (item) => AccordionSection(
            isOpen: item == data.first,
            header: Text(
              item['header'],
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            content: Dismissible(
              key: UniqueKey(),
              // Remove it
              onDismissed: (_) => onProductTap?.call(item),
              child: Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: Text(
                      item['body'],
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: const Icon(
                        Iconsax.edit,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
