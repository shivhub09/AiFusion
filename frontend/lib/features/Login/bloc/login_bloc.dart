import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:frontend/services/email.dart';
import 'package:frontend/services/loginFunction.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      LoginButtonClickedEvent event, Emitter<LoginState> emit) async {
    Map<String, dynamic> jsonResponse =
        await loginUser(event.email, event.password);
    if (jsonResponse["status"] == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', event.email);
      emit(LoginNavigateToHomeScreenActionState());
    }
    // print(response);
  }
}
