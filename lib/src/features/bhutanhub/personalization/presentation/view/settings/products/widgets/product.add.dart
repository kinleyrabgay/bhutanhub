import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/entities/product.entity.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/widgets/_step1.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/widgets/_step2.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/widgets/_step3.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/widgets/_step4.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/widgets/_step5.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key, this.product});

  final ProductEntity? product;

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // Step 1
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;

  // Step 2
  late final SingleValueDropDownController _categoryController;
  late final SingleValueDropDownController _brandController;

  // Step 3
  late final SingleValueDropDownController _conditionController;
  late final TextEditingController _discountController;
  late final SingleValueDropDownController _stockController;

  int _activeStep = 0;
  bool _isValid = false;
  bool _allTermsChecked = false;

  final List<IconData> _stepIcons = [
    Iconsax.image,
    Iconsax.category,
    Iconsax.tag,
    Iconsax.document,
  ];

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _categoryController = SingleValueDropDownController();
    _brandController = SingleValueDropDownController();
    _conditionController = SingleValueDropDownController();
    _discountController = TextEditingController();
    _stockController = SingleValueDropDownController();

    // Validate form
    _nameController.addListener(_validateForm);
    _descriptionController.addListener(_validateForm);
    _priceController.addListener(_validateForm);
    _categoryController.addListener(_validateForm);
    _brandController.addListener(_validateForm);
    _conditionController.addListener(_validateForm);
    _discountController.addListener(_validateForm);
    _stockController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    _brandController.dispose();
    _conditionController.dispose();
    _discountController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isValid = _nameController.text.trim().isNotEmpty &&
          _descriptionController.text.trim().isNotEmpty &&
          _priceController.text.trim().isNotEmpty &&
          _categoryController.dropDownValue != null &&
          _brandController.dropDownValue?.value != null &&
          _allTermsChecked;
    });
  }

  void _onStepReached(int index) {
    setState(() {
      if (index == 0) {
        _activeStep = index;
      }
      if (index == 1 &&
          _nameController.text.isNotEmpty &&
          _descriptionController.text.isNotEmpty &&
          _priceController.text.isNotEmpty) {
        _activeStep = index;
      }
      if (index == 2 &&
          _categoryController.dropDownValue != null &&
          _brandController.dropDownValue?.value != null) {
        _activeStep = index;
      }
      if (index == 3 &&
          _conditionController.dropDownValue != null &&
          _stockController.dropDownValue != null) {
        _activeStep = index + 1;
      }
    });
  }

  Future<void> _onCreateProduct(BuildContext context) async {
    context.read<PersonalizationBloc>().add(
          const CreateProductEvent(
            product: ProductEntity(
              uid: 'OO5yaWON4DeeGdG4CyRaDWQoGq13',
              image: ['https://example.com/image1.jpg'],
              quantity: 10,
              category: CategoryEntity(id: 1, name: 'Mobiles'),
              brand: BrandEntity(id: 3, name: 'Apple'),
              name: 'iPhone 14 Pro',
              description:
                  'Latest Apple iPhone with A16 chip and ProMotion display.',
              price: 999.99,
              condition: 'New',
              discount: 10.0,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: BHSizes.defaultSpace),
      child: Column(
        children: [
          // --- Header ---
          header(context),

          // --- Steps ---
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EasyStepper(
                    activeStep: _activeStep,
                    lineStyle: const LineStyle(
                      lineType: LineType.normal,
                      lineThickness: 1,
                      lineSpace: 1,
                      defaultLineColor: BHColors.grey,
                      finishedLineColor: BHColors.primary,
                    ),
                    internalPadding: 0,
                    stepRadius: 16,
                    borderThickness: 0,
                    finishedStepBackgroundColor: BHColors.primary,
                    finishedStepBorderType: BorderType.normal,
                    finishedStepIconColor: BHColors.white,
                    finishedStepTextColor: BHColors.primary,
                    stepShape: StepShape.rRectangle,
                    stepBorderRadius: 4,
                    showTitle: false,
                    fitWidth: false,
                    defaultStepBorderType: BorderType.normal,
                    direction: Axis.horizontal,
                    showScrollbar: false,
                    stepAnimationDuration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.zero,
                    // showLoadingAnimation: _activeStep < 3 ? true : false,
                    steps: List.generate(
                      4,
                      (index) => EasyStep(
                        icon: Icon(_stepIcons[index], size: 14),
                        finishIcon: const Icon(
                          Iconsax.tick_circle,
                          size: 14,
                        ),
                      ),
                    ),
                    onStepReached: _onStepReached,
                  ),
                ],
              ),
              const SizedBox(height: BHSizes.spaceItems),
              _steps.elementAt(_activeStep == 5 ? 4 : _activeStep),
            ],
          ),
        ],
      ),
    );
  }

  Row header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // --- Title
        Text(
          'Add Product',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(color: BHColors.primary),
        ),
        Row(
          children: [
            // --- Back Button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
              ),
            ),
            // --- Add Button
            if (true) ...[
              TextButton(
                onPressed: () => _onCreateProduct(context),
                child: const Text(
                  'Add',
                ),
              ),
            ],
          ],
        )
      ],
    );
  }

  List<Widget> get _steps => [
        Step1(
          nameController: _nameController,
          descriptionController: _descriptionController,
          priceController: _priceController,
        ),
        Step2(
          categoryController: _categoryController,
          brandController: _brandController,
        ),
        Step3(
          conditionController: _conditionController,
          discountController: _discountController,
          stockController: _stockController,
        ),
        Step4(
          onAllTermsChecked: (value) => {
            _allTermsChecked = value,
            _validateForm(),
          },
        ),
        const Step5()
      ];
}
