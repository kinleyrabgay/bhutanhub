import 'package:bhutanhub/core/common/widgets/custom.text.field.dart';
import 'package:bhutanhub/core/common/widgets/single.custom.dropdown.field.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/constants/texts.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/category_constant.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Step3 extends StatefulWidget {
  const Step3({
    super.key,
    required this.conditionController,
    required this.discountController,
    required this.stockController,
  });

  final SingleValueDropDownController conditionController;
  final TextEditingController discountController;
  final SingleValueDropDownController stockController;

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  String _formatNumber(String s) {
    if (s.isEmpty) return '0';
    int parsedNumber = int.parse(s.trim());
    if (parsedNumber > 100) return '0';
    return NumberFormat.decimalPattern('en').format(parsedNumber);
  }

  String get _percent => '%.';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Product Condition ---
        SingleCustomDropDownTextField(
          singleValueDropDownController: widget.conditionController,
          labelText: BHTexts.condition,
          hintText: BHTexts.hintCondition,
          searchHintText: BHTexts.searchCondition,
          dropDownList: conditionList,
          dropDownItemCount: 2,
          enableSearch: false,
          onChanged: (val) {},
        ),
        const SizedBox(height: BHSizes.spaceSections / 2),

        // --- Product Stock ---
        SingleCustomDropDownTextField(
          singleValueDropDownController: widget.stockController,
          labelText: BHTexts.stock,
          hintText: BHTexts.hintStock,
          searchHintText: BHTexts.searchStock,
          dropDownList: stockList,
          dropDownItemCount: 2,
          enableSearch: false,
          onChanged: (val) {},
        ),
        const SizedBox(height: BHSizes.spaceSections / 2),

        CustomTextFormField(
          controller: widget.discountController,
          labelText: 'Product Discount (Optional)',
          hintText: '',
          keyboardType: TextInputType.number,
          prefixText: _percent,
          onChanged: (value) {
            value = _formatNumber(value.replaceAll(',', ''));
            widget.discountController.value = TextEditingValue(
              text: value,
              selection: TextSelection.collapsed(offset: value.length),
            );
          },
        ),
        const SizedBox(height: BHSizes.spaceSections / 2),
      ],
    );
  }
}
