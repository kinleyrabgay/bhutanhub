import 'package:bhutanhub/core/common/widgets/profile.cover.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileCover(
          isProfileNetworkImage: true,
          isCoverNetworkImage: true,
          profileHeight: 80,
          profileWidth: 80,
          profileFit: BoxFit.cover,
          coverHeight: 200,
          coverWidth: double.infinity,
          borderRadius: 80,
        ),
        const SizedBox(height: BHSizes.spaceItems * 2),
        ListTile(
          title: Text(
            'Kinley Rabgay',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          subtitle: Text(
            'fsd.rabgay@gmail.com',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
