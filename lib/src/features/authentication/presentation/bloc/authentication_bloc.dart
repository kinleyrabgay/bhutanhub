import 'dart:io';
import 'package:bhutanhub/core/constants/enums.dart';
import 'package:bhutanhub/src/features/authentication/domain/entities/user.dart';
import 'package:bhutanhub/src/features/authentication/domain/usecases/cache.credentials.dart';
import 'package:bhutanhub/src/features/authentication/domain/usecases/forgot.password.dart';
import 'package:bhutanhub/src/features/authentication/domain/usecases/get.current.dart';
import 'package:bhutanhub/src/features/authentication/domain/usecases/google.sso.dart';
import 'package:bhutanhub/src/features/authentication/domain/usecases/logout.dart';
import 'package:bhutanhub/src/features/authentication/domain/usecases/sign.in.dart';
import 'package:bhutanhub/src/features/authentication/domain/usecases/sign.up.dart';
import 'package:bhutanhub/src/features/authentication/domain/usecases/update.user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required Login login,
    required Logout logout,
    required GoogleSSO sso,
    required Register register,
    required ForgotPassword forgotPassword,
    required UpdateUser updateUser,
    required CacheCredentials cacheCredentials,
    required GetCurrentUser getCurrentUser,
  })  : _login = login,
        _logout = logout,
        _register = register,
        _forgotPassword = forgotPassword,
        _updateUser = updateUser,
        _sso = sso,
        _cacheCredentials = cacheCredentials,
        _getCurrentUser = getCurrentUser,
        super(
          const AuthenticationInitial(),
        ) {
    on<LoginWithEmailEvent>(_emailSigninHandler);
    on<RegisterWithEmailEvent>(_registerHandler);
    on<ForgotPasswordEvent>(_forgotPasswordHandler);
    on<UpdateUserEvent>(_updateUserHandler);
    on<SignInWithGoogleEvent>(_googleSigninHandler);
    on<CacheCredentialsEvent>(_cacheCredentialsHandler);
    on<LogoutEvent>(_logoutHandler);
    on<GetCurrentUserEvent>(_getCurrentUserHandler);
  }

  final Login _login;
  final Logout _logout;
  final Register _register;
  final ForgotPassword _forgotPassword;
  final UpdateUser _updateUser;
  final GoogleSSO _sso;
  final CacheCredentials _cacheCredentials;
  final GetCurrentUser _getCurrentUser;

  Future<void> _googleSigninHandler(
    SignInWithGoogleEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final result = await _sso();
    result.fold(
      (failure) => emit(AuthenticationError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _emailSigninHandler(
    LoginWithEmailEvent event,
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
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _registerHandler(
    RegisterWithEmailEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final result = await _register(
      RegisterParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(AuthenticationError(failure.message)),
      (_) => emit(const AuthenticationSuccess()),
    );
  }

  // Inside your method:
  Future<void> _getCurrentUserHandler(
    GetCurrentUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final result = await _getCurrentUser();
    result.fold(
      (failure) => emit(AuthenticationError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _logoutHandler(
    LogoutEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final result = await _logout();
    result.fold(
      (failure) => emit(const Error(
        error: ErrorType.logoutErorr,
        message: 'Logout failed',
      )),
      (_) => emit(Success(success: SuccessType.logoutSuccess)),
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

  Future<void> _cacheCredentialsHandler(
    CacheCredentialsEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final result = await _cacheCredentials(
      CacheCredentialsParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(CacheCredentialsFailure(failure.message)),
      (_) => emit(const CacheCredentialsSuccess()),
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
