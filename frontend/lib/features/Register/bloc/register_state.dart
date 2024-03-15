part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

abstract class RegisterActionState extends RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterLoadedSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {}

class RegisterNavigateToLoginScreenActionState extends RegisterActionState {}

class RegisterSuccessfulRegisterActionState extends RegisterActionState {}
