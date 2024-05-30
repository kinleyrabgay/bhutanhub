import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.uid,
    required this.name,
    required this.avatar,
    required this.email,
  });

  const User.empty()
      : this(
            uid: 1,
            name: '_empty.name',
            avatar: '_empty.avatar',
            email: '_empty.email');

  final int uid;
  final String name;
  final String avatar;
  final String email;

  // If same id, same person
  @override
  List<Object> get props => [uid];
}
