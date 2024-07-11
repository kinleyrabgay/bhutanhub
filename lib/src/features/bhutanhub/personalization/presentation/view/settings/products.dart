import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:bhutanhub/core/common/widgets/custom.app.bar.dart';
import 'package:bhutanhub/core/common/widgets/loader.dart';
import 'package:bhutanhub/core/constants/about.us.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/constants/texts.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/entities/product.entity.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:iconsax/iconsax.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  static const routeName = '/products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Products',
        titleSpacing: 0,
      ),
      body: BlocListener<PersonalizationBloc, PersonalizationState>(
        listener: (context, state) {
          if (state is ProductCreationLoading) {
            EasyLoading.show(
              indicator: const CircularProgressIndicator(),
              maskType: EasyLoadingMaskType.clear,
              dismissOnTap: true,
            );
          } else if (state is ProductCreationSuccess) {
            EasyLoading.dismiss();
            BHLoaders.successSnackBar(
              title: BHTexts.successSnackTitle,
              message: BHTexts.successLoginSnackBody,
            );
          } else if (state is ProductCreationFailed) {
            EasyLoading.dismiss();
            BHLoaders.errorSnackBar(
              title: BHTexts.errorSnackTitle,
              message: state.message,
            );
          }
        },
        child: buildAboutAccordian(TestData.data, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const product = ProductEntity(
            name: 'Hello from name',
            description: 'Hello from description',
            image: 'https://picsum.photos/200',
            price: 10.0,
            quantity: 10,
            categoryId: '1',
            uid: 'EX4jtKEyMRZnXDA5uxABi124jyx1',
          );
          context
              .read<PersonalizationBloc>()
              .add(const CreateProductEvent(product: product));
        },
        elevation: 0,
        foregroundColor: BHColors.white,
        backgroundColor: BHColors.black,
        shape: ShapeBorder.lerp(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          1.0,
        ),
        child: const Icon(
          Iconsax.add,
          size: 24,
        ),
      ),
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
            content: Row(
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
                    onTap: () {},
                    child: const Icon(
                      Iconsax.edit,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
