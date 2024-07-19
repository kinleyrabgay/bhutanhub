import 'package:bhutanhub/core/common/widgets/circular.image.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageUploader extends StatelessWidget {
  const ProductImageUploader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<PersonalizationBloc, PersonalizationState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state is ImageUploadSuccess) ...[
                  Text(
                    'Click on image to upload new image',
                    style: Theme.of(context).textTheme.labelLarge!,
                  ),
                  const SizedBox(height: BHSizes.spaceItems / 2),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.15,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.15,
                      viewportFraction: 0.8,
                    ),
                    items: [...state.imageUrl].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              state.imageUrl.clear();
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
                ] else ...[
                  Text(
                    'Upload Product Image',
                    style: Theme.of(context).textTheme.labelLarge!,
                  ),
                  const SizedBox(height: BHSizes.spaceItems / 2),
                  GestureDetector(
                    child: Material(
                      color: BHColors.white,
                      child: InkWell(
                        onTap: () {
                          context.read<PersonalizationBloc>().add(
                                UploadImageEvent(),
                              );
                        },
                        child: DottedBorder(
                          color: BHColors.primary,
                          strokeWidth: 0.5,
                          dashPattern: const [3, 3, 3, 3],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(BHSizes.brMd),
                          child: Container(
                            // height: MediaQuery.of(context).size.height * 0.15,
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
                                      'Please upload atleast 3 clear image',
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
                ]
              ],
            );
          },
        )
      ],
    );
  }
}
