part of 'to_do_bloc.dart';

@immutable
sealed class ToDoEvent {}

final class ToDoInitialEvent extends ToDoEvent {}

final class ToDoAddToDoButtonClickedEvent extends ToDoEvent {}

final class ToDoAddToDoSubmitButtonClickedEvent extends ToDoEvent {
  final String description;

  ToDoAddToDoSubmitButtonClickedEvent({required this.description});

  
}
