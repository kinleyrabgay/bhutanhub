import 'package:bhutanhub/core/common/widgets/custom.app.bar.dart';
import 'package:bhutanhub/core/common/widgets/loader.dart';
import 'package:bhutanhub/core/constants/about.us.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/texts.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/product.bottom.sheet.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/product.list.dart';
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
      appBar: const CustomAppbar(title: 'Products', titleSpacing: 0),
      body: BlocListener<PersonalizationBloc, PersonalizationState>(
        listener: (context, state) {
          if (state is ImageUploading || state is ProductCreationLoading) {
            EasyLoading.show(
              indicator: const CircularProgressIndicator(),
              maskType: EasyLoadingMaskType.clear,
              dismissOnTap: true,
            );
          } else if (state is ProductCreationSuccess) {
            EasyLoading.dismiss();
            BHLoaders.successSnackBar(
              title: BHTexts.successSnackTitle,
              message: BHTexts.successProductCreationSnackBody,
            );
          } else if (state is ProductCreationFailed) {
            EasyLoading.dismiss();
            BHLoaders.errorSnackBar(
              title: BHTexts.errorSnackTitle,
              message: state.message,
            );
          } else if (state is ImageUploadSuccess) {
            EasyLoading.dismiss();
          }
        },
        child: buildProductList(TestData.data, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bottomSheetModal(context),
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

  // --- Build Product List
  Widget buildProductList(
    List<Map<String, dynamic>> data,
    BuildContext context,
  ) {
    return ProductList(data: data);
  }
}
