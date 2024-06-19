import 'package:bhutanhub/core/common/widgets/shimmer.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/utils/helpers/helper.function.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BHCircularImage extends StatelessWidget {
  const BHCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 80,
    this.height = 80,
    this.padding = BHSizes.pSm,
    this.border = 80,
    this.applyImageRadius = true,
    this.borderRadius = 80,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double border;
  final double width, height, padding;
  final bool applyImageRadius;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: BHHelperFunctions.isDarkMode(context)
            ? BHColors.black
            : BHColors.white,
        borderRadius: BorderRadius.circular(border),
      ),
      child: ClipRRect(
        borderRadius: applyImageRadius
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.zero,
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlayColor,
                  width: width,
                  height: height,
                  progressIndicatorBuilder: (
                    context,
                    url,
                    downloadProgress,
                  ) =>
                      BHShimmerEffect(
                          width: width, height: height, radius: borderRadius),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: isNetworkImage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
