import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:frontend/features/ToDo/services/fetchToDo.dart';
import 'package:meta/meta.dart';

import '../../../models/ToDoModel.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoInitial()) {
    on<ToDoInitialEvent>(toDoInitialEvent);

    on<ToDoAddToDoButtonClickedEvent>(toDoAddToDoButtonClickedEvent);
  }

  FutureOr<void> toDoInitialEvent(
      ToDoInitialEvent event, Emitter<ToDoState> emit) async {
    emit(ToDoLoadingState());
    print("This is todo initial event");

    // fetchTodo();

    Map<String, dynamic> jsonResponse = await fetchTodo();
    print(jsonResponse["todos"]);
    final todoList =
        (jsonResponse["todos"]).map((map) => TodoItem.fromJson(map)).toList();
    if (jsonResponse["status"] == true) {
      emit(ToDoLoadedSuccessState(todo: todoList));
    }
  }

  FutureOr<void> toDoAddToDoButtonClickedEvent(
      ToDoAddToDoButtonClickedEvent event, Emitter<ToDoState> emit) {
    print("Add to do button clicked event");

    emit(ToDoAddToDoButtonClicked());
  }
}
