import 'package:bhutanhub/core/constants/enums.dart';
import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/domain/repositories/authentication.dart';
import 'package:equatable/equatable.dart';

class UpdateUser extends UsecaseWithParam<void, UpdateUserParams> {
  const UpdateUser(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture<void> call(UpdateUserParams params) => _repo.updateUser(
        action: params.action,
        userData: params.userData,
      );
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({
    required this.action,
    required this.userData,
  });

  const UpdateUserParams.empty()
      : this(
          action: UpdateUserAction.displayName,
          userData: '',
        );

  final UpdateUserAction action;
  final dynamic userData;

  @override
  List<dynamic> get props => [action, userData];
}
