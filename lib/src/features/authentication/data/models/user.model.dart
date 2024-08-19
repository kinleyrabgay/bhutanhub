import 'dart:convert';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.token,
    required super.avatar,
    required super.name,
    required super.email,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel.fromMap(DataMap map)
      : super(
          token: map['token'] ?? '',
          avatar: map['avatar'] ?? '',
          name: map['name'] ?? '',
          email: map['email'] ?? '',
        );

  DataMap toMap() {
    return {
      'token': token,
      'name': name,
      'avatar': avatar,
      'emal': email,
    };
  }

  String toJson() => json.encode(toMap());

  UserModel copyWith({
    String? token,
    String? name,
    String? avatar,
    String? email,
  }) {
    return UserModel(
      token: token ?? this.token,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
    );
  }

  const UserModel.empty()
      : this(
          token: '',
          avatar: '',
          name: '',
          email: '',
        );
}
