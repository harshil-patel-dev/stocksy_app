part of 'user_bloc.dart';

class UserState extends Equatable {
  final UserModel userDetails;

  UserState({required this.userDetails});

  @override
  List<Object> get props => [];

  UserState copyWith({
    UserModel? userDetails,
  }) {
    return UserState(
      userDetails: userDetails ?? this.userDetails,
    );
  }
}
