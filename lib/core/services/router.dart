import 'package:bhutanhub/src/features/bhutanhub/bhutanhub.navigation.dart';
import 'package:bhutanhub/core/common/views/page.under.construction.dart';
import 'package:bhutanhub/core/constants/keys.dart';
import 'package:bhutanhub/core/services/injection.dart';
import 'package:bhutanhub/src/features/authentication/data/models/user.model.dart';
import 'package:bhutanhub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bhutanhub/src/features/authentication/presentation/view/sign.in.dart';
import 'package:bhutanhub/src/features/authentication/presentation/view/sign.up.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/address/address.dart';
import 'package:bhutanhub/src/features/onboarding/presentations/cubit/onboarding_cubit.dart';
import 'package:bhutanhub/src/features/onboarding/presentations/views/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fui;

part 'router.main.dart';
