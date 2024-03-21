part of 'to_do_bloc.dart';

@immutable
sealed class ToDoState {}

abstract class ToDoActionState extends ToDoState {}

class ToDoInitial extends ToDoState {}

final class ToDoLoadingState extends ToDoState {}

final class ToDoLoadedSuccessState extends ToDoState {
  final List todo;

  ToDoLoadedSuccessState({required this.todo});

}

final class ToDoAddToDoButtonClicked extends ToDoActionState {}
