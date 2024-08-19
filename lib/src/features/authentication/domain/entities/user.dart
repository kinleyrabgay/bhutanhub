import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.token,
    required this.name,
    required this.avatar,
    required this.email,
    this.bio,
    this.createdAt,
    this.username,
    this.contact,
    this.ratings,
  });

  const UserEntity.empty()
      : this(
          token: '',
          name: '',
          username: '',
          bio: '',
          createdAt: null,
          avatar: '',
          email: '',
          contact: '',
          ratings: const {},
        );

  final String token;
  final String name;
  final String? username;
  final String avatar;
  final String email;
  final DateTime? createdAt;
  final String? contact;
  final String? bio;
  final Object? ratings;

  // If same id, same person
  @override
  List<Object> get props => [token];
}
