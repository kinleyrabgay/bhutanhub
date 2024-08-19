import 'package:bhutanhub/core/common/widgets/profile.cover.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return Column(
      children: [
        ProfileCover(
          isProfileNetworkImage: true,
          isCoverNetworkImage: true,
          profileHeight: 80,
          profileWidth: 80,
          profileFit: BoxFit.cover,
          coverHeight: 200,
          coverWidth: double.infinity,
          profileImageUrl: user!.avatar,
          borderRadius: 80,
        ),
        const SizedBox(height: BHSizes.spaceItems * 2),
        ListTile(
          title: Text(
            user.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          subtitle: Text(
            user.email,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
