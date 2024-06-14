import 'package:bhutan_hub/core/common/views/page.under.construction.dart';
import 'package:bhutan_hub/core/constants/index.dart';
import 'package:bhutan_hub/core/models/bottom_nav.dart';
import 'package:bhutan_hub/core/services/injection.dart';
import 'package:bhutan_hub/navigation.menu.dart';
import 'package:bhutan_hub/src/features/authentication/data/models/user.model.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/view/sign.in.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/view/sign.up.dart';
import 'package:bhutan_hub/src/features/onboarding/presentations/cubit/onboarding_cubit.dart';
import 'package:bhutan_hub/src/features/onboarding/presentations/views/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fui;

part 'router.main.dart';
