import 'package:bhutanhub/core/common/widgets/circular.image.dart';
import 'package:bhutanhub/core/common/widgets/cover.image.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileCover extends StatelessWidget {
  const ProfileCover({
    super.key,
    required this.profileWidth,
    required this.profileHeight,
    required this.coverHeight,
    required this.coverWidth,
    this.coverImageUrl =
        'https://w0.peakpx.com/wallpaper/454/815/HD-wallpaper-naruto-art-fictional-character.jpg',
    this.profileImageUrl =
        'https://w0.peakpx.com/wallpaper/454/815/HD-wallpaper-naruto-art-fictional-character.jpg',
    this.coverFit = BoxFit.cover,
    this.profileFit = BoxFit.cover,
    required this.isProfileNetworkImage,
    required this.isCoverNetworkImage,
    required this.borderRadius,
    this.padding = BHSizes.pSm / 2,
  });

  final double profileWidth, profileHeight, coverWidth, coverHeight;
  final String? coverImageUrl;
  final String? profileImageUrl;
  final BoxFit? coverFit;
  final BoxFit? profileFit;
  final bool isProfileNetworkImage, isCoverNetworkImage;
  final double borderRadius;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BHCoverImage(
          image: coverImageUrl!,
          isNetworkImage: isCoverNetworkImage,
          fit: coverFit,
          width: coverWidth,
          height: coverHeight,
        ),
        Positioned(
          bottom: -40,
          left: BHSizes.defaultSpace,
          child: BHCircularImage(
            image: profileImageUrl!,
            isNetworkImage: isProfileNetworkImage,
            width: profileWidth,
            height: profileHeight,
            border: borderRadius,
            padding: padding!,
            fit: profileFit,
          ),
        ),
        Positioned(
          bottom: -80,
          right: BHSizes.defaultSpace,
          child: GestureDetector(
            onTap: () {},
            child: const Icon(Iconsax.edit),
          ),
        ),
        // Positioned(
        //   bottom: -80,
        //   right: BHSizes.defaultSpace,
        //   child: GestureDetector(
        //     onTap: () {},
        //     child: const Icon(Iconsax.logout),
        //   ),
        // ),
      ],
    );
  }
}
