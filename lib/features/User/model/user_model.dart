// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? accessToken;
  final String? refreshToken;
  final int? userId;
  final String? userName;
  final String? userProfilePicture;

  const UserModel({
    this.accessToken,
    this.refreshToken,
    this.userId,
    this.userName,
    this.userProfilePicture,
  });

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        userId,
        userName,
        userProfilePicture,
      ];

  UserModel copyWith({
    String? accessToken,
    String? refreshToken,
    int? userId,
    String? userName,
    int? role,
    String? userProfilePicture
  }) {
    return UserModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userProfilePicture: userProfilePicture ?? this.userProfilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'userId': userId,
      'userName': userName,
      'userProfilePicture': userProfilePicture,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      accessToken: map['accessToken'] != null ? map["accessToken"] ?? '' as String : null,
      refreshToken: map['refreshToken'] != null ? map["refreshToken"] ?? '' as String : null,
      userId: map['userId'] != null ? map["userId"] ?? 0 as int : null,
      userName: map['userName'] != null ? map["userName"] ?? '' as String : null,
      userProfilePicture: map['userProfilePicture'] != null ? map["userProfilePicture"] ?? '' as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
