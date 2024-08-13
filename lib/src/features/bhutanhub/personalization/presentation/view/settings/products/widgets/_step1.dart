import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhutanhub/core/common/widgets/circular.image.dart';
import 'package:bhutanhub/core/common/widgets/custom.text.field.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/constants/texts.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class Step1 extends StatefulWidget {
  const Step1({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
    required this.onImageUrlsChanged,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final Function(List<String>) onImageUrlsChanged;

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  List<String> _imageUrls = [];

  String _formatNumber(String s) {
    if (s.isEmpty) return '0';
    int parsedNumber = int.parse(s.trim());
    return NumberFormat.decimalPattern('en').format(parsedNumber);
  }

  String get _currency => 'Nu.';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalizationBloc, PersonalizationState>(
      builder: (context, state) {
        if (state is ImageUploadSuccess) {
          _imageUrls = state.imageUrl;
          widget.onImageUrlsChanged(_imageUrls);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Image uploader
            if (_imageUrls.isNotEmpty) ...[
              _imageUploader(context)
            ] else ...[
              _defaultImageUploader(context)
            ],
            const SizedBox(height: BHSizes.spaceSections / 2),

            // --- Product Name ---
            CustomTextFormField(
              controller: widget.nameController,
              labelText: 'Product Name',
              hintText: 'Enter a name for your product',
              onChanged: (value) => widget.nameController.text = value,
            ),
            const SizedBox(height: BHSizes.spaceSections / 2),

            // --- Product Price ---
            CustomTextFormField(
              controller: widget.priceController,
              labelText: 'Product Price',
              hintText: '',
              prefixText: _currency,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                value = _formatNumber(value.replaceAll(',', ''));
                widget.priceController.value = TextEditingValue(
                  text: value,
                  selection: TextSelection.collapsed(offset: value.length),
                );
              },
            ),
            const SizedBox(height: BHSizes.spaceSections / 2),

            // --- Product Description ---
            CustomTextFormField(
              controller: widget.descriptionController,
              maxLines: 1,
              keyboardType: TextInputType.multiline,
              labelText: 'Product Description',
              hintText: 'Enter a description for your product',
              onChanged: (value) => widget.descriptionController.text = value,
            ),
            const SizedBox(height: BHSizes.spaceSections / 2),
          ],
        );
      },
    );
  }

  Column _defaultImageUploader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          BHTexts.uploadProductImage,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(color: BHColors.primary),
        ),
        const SizedBox(height: BHSizes.spaceItems / 2),
        GestureDetector(
          child: Material(
            color: BHColors.white,
            child: InkWell(
              onTap: () {
                context.read<PersonalizationBloc>().add(UploadImageEvent());
              },
              child: DottedBorder(
                color: BHColors.primary,
                strokeWidth: 0.5,
                dashPattern: const [3, 3, 3, 3],
                borderType: BorderType.RRect,
                radius: const Radius.circular(BHSizes.brMd),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(BHSizes.brMd),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(BHSizes.pLg),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Iconsax.image,
                            size: 30,
                            color: BHColors.primary.withOpacity(0.4),
                          ),
                          const SizedBox(height: BHSizes.spaceItems),
                          Text(
                            'Please upload at least 3 clear images',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(fontSizeDelta: -1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _imageUploader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Click on image to upload new image',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(color: BHColors.primary),
        ),
        const SizedBox(height: BHSizes.spaceItems / 2),
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.15,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.15,
            viewportFraction: 0.77,
          ),
          items: _imageUrls.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _imageUrls.clear();
                    });
                    context.read<PersonalizationBloc>().add(
                          UploadImageEvent(),
                        );
                  },
                  child: BHCircularImage(
                    borderRadius: 4,
                    image: i,
                    isNetworkImage: true,
                    border: 4,
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
