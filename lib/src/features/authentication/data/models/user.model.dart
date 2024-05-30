import 'dart:convert';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.uid,
    required super.avatar,
    required super.name,
    required super.email,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel.fromMap(DataMap map)
      : super(
          uid: map['uid'] ?? 0,
          avatar: map['avatar'] ?? '',
          name: map['name'] ?? '',
          email: map['email'] ?? '',
        );

  DataMap toMap() {
    return {
      'uid': uid,
      'name': name,
      'avatar': avatar,
      'emal': email,
    };
  }

  String toJson() => json.encode(toMap());

  UserModel copyWith({
    int? uid,
    String? name,
    String? avatar,
    String? email,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
    );
  }

  const UserModel.empty()
      : this(
          uid: 1,
          avatar: '_empty.avatar',
          name: '_empty.name',
          email: '_empty.email',
        );
}
