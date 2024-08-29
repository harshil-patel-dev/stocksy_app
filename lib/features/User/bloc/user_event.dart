part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SetUserDetails extends UserEvent {
  const SetUserDetails({required this.userDetails});
  final Map userDetails;
  @override
  List<Object> get props => [userDetails];
}

class GetUserDetails extends UserEvent {}

class SetInitialUserDetails extends UserEvent {}
