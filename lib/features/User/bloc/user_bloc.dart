import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/user_model.dart';
import '../repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;
  UserBloc({required this.userRepository})
      : super(UserState(userDetails: const UserModel())) {
    on<SetInitialUserDetails>(((event, emit) async {
      String? token = await userRepository.getAccessToken();
      if (token == null) {
        await userRepository.setUserDetails(
          userDetails: {
            'accessToken': null,
            'refreshToken': null,
            'role': 0,
            'userCode': 0,
          },
        );
      }
      add(GetUserDetails());
    }));
    on<GetUserDetails>(((event, emit) async {
      UserModel userDetailsModel = await userRepository.getUserDetails();
      emit(state.copyWith(userDetails: userDetailsModel));
    }));
    on<SetUserDetails>((event, emit) async {
      await userRepository.setUserDetails(
        userDetails: {
          'accessToken': null,
          'refreshToken': null,
          'role': 0,
          'userCode': 0,
        },
      );
      add(GetUserDetails());
    });
  }
}
