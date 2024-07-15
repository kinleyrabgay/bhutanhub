import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ImageUploader extends StatelessWidget {
  const ImageUploader({
    super.key,
    required this.hint,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BHSizes.brMd),
              ),
              child: Padding(
                padding: const EdgeInsets.all(BHSizes.pMd),
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
                        hint,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
