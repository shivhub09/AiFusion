import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoInitial()) {
    on<ToDoInitialEvent>(toDoInitialEvent);

    on<ToDoAddToDoButtonClickedEvent>(toDoAddToDoButtonClickedEvent);
  }

  FutureOr<void> toDoInitialEvent(
      ToDoInitialEvent event, Emitter<ToDoState> emit) {
    print("This is todo initial event");
    emit(ToDoLoadedSuccessState());
  }

  FutureOr<void> toDoAddToDoButtonClickedEvent(
      ToDoAddToDoButtonClickedEvent event, Emitter<ToDoState> emit) {
    print("Add to do button clicked event");

    emit(ToDoAddToDoButtonClicked());
  }
}
