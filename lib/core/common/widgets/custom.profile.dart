import 'package:bhutan_hub/core/common/widgets/circular.image.dart';
import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BHProfile extends StatelessWidget {
  const BHProfile({
    super.key,
    required this.imgUrl,
    this.onPressed,
  });

  final String imgUrl;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const BHCircularImage(
        image:
            'https://w0.peakpx.com/wallpaper/454/815/HD-wallpaper-naruto-art-fictional-character.jpg',
        isNetworkImage: true,
        width: 80,
        height: 80,
        border: 80,
        fit: BoxFit.cover,
      ),
      title: Text(
        'Kinley Rabgay',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: BHColors.white),
      ),
      subtitle: Text(
        'Kinley@gmail.com',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: BHColors.white),
      ),
      trailing: SizedBox(
        width: 24,
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: BHColors.white,
          ),
        ),
      ),
    );
  }
}
