import 'package:bhutanhub/core/constants/texts.dart';

class Term {
  final String text;
  final bool value;

  Term({
    required this.text,
    required this.value,
  });
}

final List<Term> terms = [
  Term(text: BHTexts.term1, value: false),
  Term(text: BHTexts.term2, value: false),
  Term(text: BHTexts.term3, value: false),
  Term(text: BHTexts.term4, value: false),
  Term(text: BHTexts.term5, value: false),
  Term(text: BHTexts.term6, value: false),
];
