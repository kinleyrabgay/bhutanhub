import 'dart:async';

import 'package:bhutan_hub/core/services/internet/internet_cubit.dart';
import 'package:bhutan_hub/core/store/store.dart';
import 'package:bhutan_hub/src/features/authentication/data/datasources/local.dart';
import 'package:bhutan_hub/src/features/authentication/data/datasources/remote.dart';
import 'package:bhutan_hub/src/features/authentication/data/repositories/auth.repo.implementation.dart';
import 'package:bhutan_hub/src/features/authentication/domain/repositories/authentication.dart';
import 'package:bhutan_hub/src/features/authentication/domain/usecases/cache.credentials.dart';
import 'package:bhutan_hub/src/features/authentication/domain/usecases/forgot.password.dart';
import 'package:bhutan_hub/src/features/authentication/domain/usecases/google.sso.dart';
import 'package:bhutan_hub/src/features/authentication/domain/usecases/sign.in.dart';
import 'package:bhutan_hub/src/features/authentication/domain/usecases/sign.up.dart';
import 'package:bhutan_hub/src/features/authentication/domain/usecases/update.user.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'injection.main.dart';