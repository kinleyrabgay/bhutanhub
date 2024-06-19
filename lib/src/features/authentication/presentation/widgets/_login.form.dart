import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/keys.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/constants/texts.dart';
import 'package:bhutanhub/core/services/injection.dart';
import 'package:bhutanhub/core/store/store.dart';
import 'package:bhutanhub/core/utils/validators/validator.dart';
import 'package:bhutanhub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late StorageService _pref;

  bool _hidePassword = true;
  bool _rememberMe = false;

  Future<void> _loadCredentials() async {
    final email = await _pref.getString(ConstantKeys.rememberEmail) ?? '';
    final password = await _pref.getString(ConstantKeys.rememberPassword) ?? '';
    setState(() {
      _emailController.text = email;
      _passwordController.text = password;
    });
  }

  Future<void> _performLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final authBloc = context.read<AuthenticationBloc>();

      // Dispatch login event
      authBloc.add(
        LoginWithEmailEvent(
          email: _emailController.text,
          password: _passwordController.text,
          rememberMe: _rememberMe,
        ),
      );

      // Cache credentials if rememberMe is true
      if (_rememberMe) {
        authBloc.add(
          CacheCredentialsEvent(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
      }
    }
  }

  Future<void> _performForgotPassword(BuildContext context) async {
    context.read<AuthenticationBloc>().add(
          ForgotPasswordEvent(
            email: _emailController.text,
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _pref = sl<StorageService>();
    _loadCredentials();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          email(context),
          const SizedBox(height: BHSizes.spaceSections),
          password(context),
          const SizedBox(height: BHSizes.spaceItems),
          rememberMe(context),
          const SizedBox(height: BHSizes.spaceItems * 0.5),
          loginButton(context)
        ],
      ),
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
            border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
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

  Row rememberMe(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = !_rememberMe;
                    });
                  }),
            ),
            const SizedBox(width: 5),
            Text(
              BHTexts.rememberMe,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        TextButton(
          onPressed: () => _performForgotPassword(context),
          child: Text(
            BHTexts.forgetPassword,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: Colors.blueAccent),
          ),
        )
      ],
    );
  }

  SizedBox loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _performLogin(context),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login', style: TextStyle(color: BHColors.white)),
          ],
        ),
      ),
    );
  }
}
