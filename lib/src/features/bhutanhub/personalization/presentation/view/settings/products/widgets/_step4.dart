import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/constants/terms.dart';
import 'package:flutter/material.dart';

class Step4 extends StatefulWidget {
  const Step4({
    super.key,
    required this.onAllTermsChecked,
  });

  final ValueChanged<bool> onAllTermsChecked;

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  late List<Term> _terms;

  @override
  void initState() {
    super.initState();
    _terms = terms;
  }

  void _toggleCheck(int index) {
    setState(() {
      _terms[index] = Term(
        text: _terms[index].text,
        value: !_terms[index].value,
      );

      // Check if all terms are checked
      _checkAllTerms();
    });
  }

  void _checkAllTerms() {
    bool allChecked = _terms.every((term) => term.value);
    widget.onAllTermsChecked(allChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Terms and Conditions',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(color: BHColors.primary),
        ),
        const SizedBox(height: BHSizes.spaceSections / 2),
        ..._terms.asMap().entries.map((entry) {
          int index = entry.key;
          Term term = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: BHSizes.spaceItems),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    value: term.value,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    onChanged: (value) => _toggleCheck(index),
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    term.text,
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: BHColors.primary.withOpacity(0.8),
                          fontSizeDelta: -2,
                        ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
