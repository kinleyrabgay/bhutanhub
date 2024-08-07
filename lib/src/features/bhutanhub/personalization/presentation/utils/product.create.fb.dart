import 'package:reactive_forms/reactive_forms.dart';

FormGroup createProductForm() {
  return FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'description': FormControl<String>(
      validators: [Validators.required],
    ),
    'image': FormControl<String>(validators: [
      Validators.required,
      Validators.pattern(r'^(https?|ftp)://[^\s/$.?#].[^\s]*$')
    ]),
    'price': FormControl<double>(
      validators: [Validators.required, Validators.min(0)],
    ),
    'quantity': FormControl<int>(
      validators: [Validators.required, Validators.min(0)],
    ),
    'categoryId': FormControl<String>(
      validators: [Validators.required],
    ),
  });
}
