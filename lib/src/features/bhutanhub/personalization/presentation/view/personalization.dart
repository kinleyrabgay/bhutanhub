import 'package:bhutanhub/core/common/widgets/section.menu.tile.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/settings.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PersonalizationView extends StatelessWidget {
  const PersonalizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const ProfileWidget(),
            const SizedBox(height: BHSizes.spaceItems),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: BHSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  buildSettingsGroup(
                    'Account Settings',
                    Settings.accountSettings,
                    context,
                  ),
                  const SizedBox(height: BHSizes.spaceSections),

                  buildSettingsGroup(
                    'App Settings',
                    Settings.appSettings,
                    context,
                  ),
                  const SizedBox(height: BHSizes.spaceSections),

                  buildSettingsGroup(
                    'Privacy and Security',
                    Settings.privacySettings,
                    context,
                  ),
                  const SizedBox(height: BHSizes.spaceSections),

                  buildSettingsGroup(
                    'Support',
                    Settings.supportSettings,
                    context,
                  ),
                  const SizedBox(height: BHSizes.spaceSections),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Logout'),
                          SizedBox(width: BHSizes.spaceItems),
                          Icon(Iconsax.logout),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: BHSizes.spaceSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsGroup(
    String title,
    List<Map<String, dynamic>> settings,
    BuildContext context,
  ) {
    return Container(
      color: BHColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...settings.map(
            (item) => BHSettingMenuTile(
              icon: item['icon'],
              title: item['title'],
              subTitle: item['subTitle'],
              isLast: item == settings.last,
              trailing: item['isSwitch']
                  ? SizedBox(
                      width: 24,
                      child: Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: item['value'],
                          onChanged: (value) {},
                        ),
                      ),
                    )
                  : null,
              onTap: () {
                if (item['route'] != null) {
                  Navigator.pushNamed(
                    context,
                    item['route'],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
