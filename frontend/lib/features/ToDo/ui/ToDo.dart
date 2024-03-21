import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/ToDo/bloc/to_do_bloc.dart';
import 'package:frontend/features/ToDo/services/fetchToDo.dart';
import 'package:frontend/features/ToDo/ui/ToDoTile.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/ToDoModel.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final ToDoBloc toDoBloc = new ToDoBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toDoBloc.add(ToDoInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            // fetchTodo();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 22,
          ),
        ),
        appBar: AppBar(
          title: Center(
              child: Text(
            "To Do",
            style: GoogleFonts.urbanist(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          )),
        ),
        body: BlocConsumer<ToDoBloc, ToDoState>(
          bloc: toDoBloc,
          listenWhen: (previous, current) => current is ToDoActionState,
          buildWhen: (previous, current) => current is! ToDoActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case ToDoLoadingState:
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              case ToDoLoadedSuccessState:
                final success = state as ToDoLoadedSuccessState;
                final todoList = success.todo;
                return ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    final todoItem = todoList[index];
                    return ToDoTile(
                        description: todoItem.description,
                        id: todoItem.id,
                        status: todoItem.completed);
                  },
                );
              default:
                return Container();
            }
          },
        ));
  }
}
