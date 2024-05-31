import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:bhutan_hub/core/constants/texts.dart';
import 'package:bhutan_hub/core/utils/validators/validator.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
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
  bool _hidePassword = true;
  bool _rememberMe = false;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: BHSizes.spaceItems / 2),
              TextFormField(
                // controller: controller.email,
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
                // controller: controller.email,
                validator: (value) => BHValidator.validateEmail(value),
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
          ),
          const SizedBox(height: BHSizes.spaceItems),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember Me
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

              // Forget Password
              TextButton(
                onPressed: () {},
                child: Text(
                  BHTexts.forgetPassword,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: Colors.blueAccent),
                ),
              )
            ],
          ),
          const SizedBox(height: BHSizes.spaceItems * 0.5),

          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.read<AuthenticationBloc>().add(
                    LoginWithEmailEvent(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login', style: TextStyle(color: BHColors.white)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
