import 'package:bhutan_hub/core/common/widgets/password.strength.dart';
import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:bhutan_hub/core/utils/validators/password.strength.dart';
import 'package:bhutan_hub/core/utils/validators/validator.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;
  double _passwordStrength = 0;
  String _passwordStrengthText = '';

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _updatePasswordStrength(String password) {
    final result = checkPasswordStrength(password);
    setState(() {
      _passwordStrength = result.strength;
      _passwordStrengthText = result.strengthText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: BHSizes.spaceItems / 2),
              TextFormField(
                controller: _emailController,
                validator: (value) => BHValidator.validateEmail(value),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  hintText: 'youremail@email.xyz',
                  hintStyle: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: BHSizes.spaceSections),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: BHSizes.spaceItems / 2),
              TextFormField(
                controller: _passwordController,
                validator: (value) => BHValidator.validatePassword(value),
                obscureText: _hidePassword,
                onChanged: (value) {
                  _updatePasswordStrength(value);
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  hintText: 'yourpassword@123!#',
                  hintStyle: Theme.of(context).textTheme.labelLarge,
                  suffixIcon: IconButton(
                    icon: _hidePassword
                        ? const Icon(Iconsax.eye_slash)
                        : const Icon(Iconsax.eye),
                    onPressed: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                  ),
                ),
              ),
              if (_passwordController.text.isNotEmpty) ...[
                PasswordStrengthWidget(
                  passwordStrength: _passwordStrength,
                  passwordStrengthText: _passwordStrengthText,
                )
              ]
            ],
          ),
          const SizedBox(height: BHSizes.spaceSections),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Confirm Password',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: BHSizes.spaceItems / 2),
              TextFormField(
                controller: _confirmPasswordController,
                validator: (value) => BHValidator.validatePassword(value),
                obscureText: _hideConfirmPassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  hintText: 'yourpassword@123!#',
                  hintStyle: Theme.of(context).textTheme.labelLarge,
                  suffixIcon: IconButton(
                    icon: _hideConfirmPassword
                        ? const Icon(Iconsax.eye_slash)
                        : const Icon(Iconsax.eye),
                    onPressed: () {
                      setState(() {
                        _hideConfirmPassword = !_hideConfirmPassword;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: BHSizes.spaceSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.read<AuthenticationBloc>().add(
                    SignInWithEmailEvent(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      color: BHColors.white,
                    ),
                  ),
                  SizedBox(width: BHSizes.spaceItems),
                  Icon(Iconsax.arrow_right_1)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
