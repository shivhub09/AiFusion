import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:frontend/services/loginFunction.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(loginInitialEvent);

    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
  }

  FutureOr<void> loginInitialEvent(
      LoginInitialEvent event, Emitter<LoginState> emit) async {
    print("This is the initial login event");

    emit(LoginLoadingState());

    await Future.delayed(Duration(seconds: 3));

    emit(LoginLoadedSuccessState());
  }

  FutureOr<void> loginButtonClickedEvent(
      LoginButtonClickedEvent event, Emitter<LoginState> emit) {
    var response = loginUser(event.email, event.password);
    print(response);
  }
}
