import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/utils/validators/validator.dart';
import 'package:bhutanhub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
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

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _nameController;

  Future<void> _performRegister(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.read<AuthenticationBloc>().add(
            RegisterWithEmailEvent(
              name: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name(context),
          const SizedBox(height: BHSizes.spaceSections),
          email(context),
          const SizedBox(height: BHSizes.spaceSections),
          password(context),
          const SizedBox(height: BHSizes.spaceSections),
          confirmPassword(context),
          const SizedBox(height: BHSizes.spaceSections),
          registerButton(context)
        ],
      ),
    );
  }

  Column name(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: BHSizes.spaceItems / 2),
        TextFormField(
          controller: _nameController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            ),
            hintText: 'yourname',
            hintStyle: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }

  Column email(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: BHSizes.spaceItems / 2),
        TextFormField(
          controller: _emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
    );
  }

  Column password(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: BHSizes.spaceItems / 2),
        TextFormField(
          controller: _passwordController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => BHValidator.validatePassword(value),
          obscureText: _hidePassword,
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
      ],
    );
  }

  Column confirmPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Confirm Password',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: BHSizes.spaceItems / 2),
        TextFormField(
          controller: _confirmPasswordController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => BHValidator.validatePasswordConfirm(
            value,
            _passwordController.text,
          ),
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
    );
  }

  SizedBox registerButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _performRegister(context),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register',
              style: TextStyle(
                color: BHColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
