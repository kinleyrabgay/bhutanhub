import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/address-book/widgets/single.address.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  static const routeName = '/user-address';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: BHColors.primary,
        child: const Icon(
          Iconsax.add,
          color: BHColors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BHSizes.defaultSpace),
          child: Column(
            children: [
              BHSingleAddress(selectedAddress: true),
              BHSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
