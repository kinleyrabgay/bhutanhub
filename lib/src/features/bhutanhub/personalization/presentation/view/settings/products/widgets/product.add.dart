import 'package:bhutanhub/core/common/widgets/custom.dropdown.field.dart';
import 'package:bhutanhub/core/common/widgets/custom.text.field.dart';
import 'package:bhutanhub/core/common/widgets/horizontal.step.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/entities/product.entity.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/brand_constant.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/category_constant.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/widgets/product.image.uploader.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({
    super.key,
    this.product,
  });

  final ProductEntity? product;

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late SingleValueDropDownController _categoryController;
  late SingleValueDropDownController _brandController;

  final String _locale = 'en';

  String _formatNumber(String s) {
    if (s.isEmpty) return '0';
    int parsedNumber = int.parse(s.trim());
    return NumberFormat.decimalPattern(_locale).format(parsedNumber);
  }

  String get _currency => 'Nu.';

  final List<String> titles = [
    'TextConstant.CART',
    'TextConstant.ADDRESS',
    'TextConstant.PAYMENT'
  ];
  final int _curStep = 1;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _categoryController = SingleValueDropDownController();
    _brandController = SingleValueDropDownController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    _brandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO
        // HorizontalStepper(
        //   width: MediaQuery.of(context).size.width,
        //   curStep: _curStep,
        //   color: const Color(0xff50AC02),
        //   showTitle: false,
        //   titles: titles,
        // ),
        // --- Product Image Uploader ---
        const ProductImageUploader(),
        const SizedBox(height: BHSizes.spaceSections / 2),

        // --- Product Category ---
        CustomDropDownTextField(
          controller: _categoryController,
          labelText: 'Product Category',
          hintText: 'Select a category',
          searchHintText: 'Search for a category',
          dropDownItemCount: 2,
          dropDownList: categoryList,
          onChanged: (val) {},
        ),
        const SizedBox(height: BHSizes.spaceSections / 2),

        // --- Product Brand ---
        CustomDropDownTextField(
          controller: _brandController,
          labelText: 'Product Brand',
          hintText: 'Select a brand',
          searchHintText: 'Search for a brand',
          dropDownItemCount: 2,
          dropDownList: brandList,
          onChanged: (val) {},
        ),
        const SizedBox(height: BHSizes.spaceSections / 2),

        // --- Product Name ---
        CustomTextFormField(
          controller: _nameController,
          labelText: 'Product Name',
          hintText: 'Enter a name for your product',
          onChanged: (value) => _nameController.text = value,
        ),
        const SizedBox(height: BHSizes.spaceSections / 2),

        // --- Product Price ---
        CustomTextFormField(
          controller: _priceController,
          labelText: 'Product Price',
          hintText: '',
          prefixText: _currency,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            value = _formatNumber(value.replaceAll(',', ''));
            _priceController.value = TextEditingValue(
              text: value,
              selection: TextSelection.collapsed(offset: value.length),
            );
          },
        ),
        const SizedBox(height: BHSizes.spaceSections / 2),

        // --- Product Description ---
      ],
    );
  }
}
