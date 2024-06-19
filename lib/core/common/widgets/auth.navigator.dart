import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({
    super.key,
    required this.text,
    required this.navigatorText,
    required this.routerName,
  });

  final String text;
  final String navigatorText;
  final String routerName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(width: BHSizes.spaceItems / 2),
        TextButton(
          onPressed: () => Navigator.pushNamed(
            context,
            routerName,
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            // minimumSize: const Size(50, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerLeft,
          ),
          child: Text(
            navigatorText,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }
}
