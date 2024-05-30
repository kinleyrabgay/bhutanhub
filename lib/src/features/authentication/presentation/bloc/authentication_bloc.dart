import 'dart:io';
import 'package:bhutan_hub/core/constants/enums.dart';
import 'package:bhutan_hub/src/features/authentication/domain/entities/user.dart';
import 'package:bhutan_hub/src/features/authentication/domain/usecases/forgot.password.dart';
import 'package:bhutan_hub/src/features/authentication/domain/usecases/google.sso.dart';
import 'package:bhutan_hub/src/features/authentication/domain/usecases/sign.in.dart';
import 'package:bhutan_hub/src/features/authentication/domain/usecases/sign.up.dart';
import 'package:bhutan_hub/src/features/authentication/domain/usecases/update.user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required Login login,
    required GoogleSSO sso,
    required Register register,
    required ForgotPassword forgotPassword,
    required UpdateUser updateUser,
  })  : _login = login,
        _register = register,
        _forgotPassword = forgotPassword,
        _updateUser = updateUser,
        _sso = sso,
        super(
          const AuthenticationInitial(),
        ) {
    on<AuthenticationEvent>((event, emit) {
      emit(const AuthLoading());
    });
    on<SignInWithEmailEvent>(_emailSigninHandler);
    on<RegisterEvent>(_registerHandler);
    on<ForgotPasswordEvent>(_forgotPasswordHandler);
    on<UpdateUserEvent>(_updateUserHandler);
    on<SignInWithGoogleEvent>(_googleSigninHandler);
  }

  final Login _login;
  final Register _register;
  final ForgotPassword _forgotPassword;
  final UpdateUser _updateUser;
  final GoogleSSO _sso;

  Future<void> _googleSigninHandler(
    SignInWithGoogleEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    await _sso();
    emit(AuthenticationSuccess());
  }

  Future<void> _emailSigninHandler(
    SignInWithEmailEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final result = await _login(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(AuthenticationError(failure.message)),
      (user) => emit(SignedIn(user)),
    );
  }

  Future<void> _registerHandler(
    RegisterEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final result = await _register(
      RegisterParams(
        email: event.email,
        fullName: event.name,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(AuthenticationError(failure.message)),
      (_) => emit(const SignedUp()),
    );
  }

  Future<void> _forgotPasswordHandler(
    ForgotPasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final result = await _forgotPassword(event.email);
    result.fold(
      (failure) => emit(AuthenticationError(failure.message)),
      (_) => emit(const ForgotPasswordSent()),
    );
  }

  Future<void> _updateUserHandler(
    UpdateUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final result = await _updateUser(
      UpdateUserParams(
        action: event.action,
        userData: event.userData,
      ),
    );
    result.fold(
      (failure) => emit(AuthenticationError(failure.message)),
      (_) => emit(const UserUpdated()),
    );
  }
}
