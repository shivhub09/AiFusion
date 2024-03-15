import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:frontend/services/registerFunction.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterInitialEvent>(registerInitialEvent);
    on<RegisterButtonClickedEvent>(registerButtonClickedEvent);
  }

  FutureOr<void> registerInitialEvent(
      RegisterInitialEvent event, Emitter<RegisterState> emit) async {
    print("This is register initial event");

    emit(RegisterLoadingState());

    Future.delayed(Duration(seconds: 3));

    emit(RegisterLoadedSuccessState());
  }

  FutureOr<void> registerButtonClickedEvent(
      RegisterButtonClickedEvent event, Emitter<RegisterState> emit) async {
    Map<String, dynamic> jsonResponse = await registerUser(
      event.email,
      event.name,
      event.password,
    );

    if (jsonResponse["status"] == true) {
      emit(RegisterSuccessfulRegisterActionState());

      Future.delayed(Duration(seconds: 2));

      emit(RegisterNavigateToLoginScreenActionState());
    }
  }
}
