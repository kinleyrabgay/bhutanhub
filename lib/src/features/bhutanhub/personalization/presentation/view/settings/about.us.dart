import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:bhutanhub/core/common/widgets/custom.app.bar.dart';
import 'package:bhutanhub/core/constants/about.us.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  static const routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'About Us',
        titleSpacing: 0,
      ),
      body: buildAboutAccordian(AboutConstant.data, context),
    );
  }

  Widget buildAboutAccordian(
    List<Map<String, dynamic>> data,
    BuildContext context,
  ) {
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
            content: Text(
              item['body'],
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        )
      ],
    );
  }
}
