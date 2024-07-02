import 'package:bhutanhub/core/common/widgets/custom.app.bar.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  static const routeName = '/feedback';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        title: 'Feedback',
        titleSpacing: 0,
      ),
    );
  }
}
