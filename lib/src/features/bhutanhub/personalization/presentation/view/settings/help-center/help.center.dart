import 'package:bhutanhub/core/common/widgets/custom.app.bar.dart';
import 'package:flutter/material.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  static const routeName = '/help-center';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        title: 'Help Center',
        titleSpacing: 0,
      ),
    );
  }
}
