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
}
