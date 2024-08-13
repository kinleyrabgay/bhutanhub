import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.uid,
    required this.name,
    required this.avatar,
    required this.email,
    this.contact,
    this.ratings,
  });

  const UserEntity.empty()
      : this(
          uid: '',
          name: '',
          avatar: '',
          email: '',
          contact: '',
          ratings: const {},
        );

  final String uid;
  final String name;
  final String avatar;
  final String email;
  final String? contact;
  final Object? ratings;

  // If same id, same person
  @override
  List<Object> get props => [uid];
}
