import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/ToDo/bloc/to_do_bloc.dart';
import 'package:frontend/features/ToDo/services/fetchToDo.dart';
import 'package:frontend/features/ToDo/ui/ToDoTile.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/ToDoModel.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final ToDoBloc toDoBloc = ToDoBloc();

  @override
  void initState() {
    super.initState();
    toDoBloc.add(ToDoInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _addTodo = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          toDoBloc.add(ToDoAddToDoButtonClickedEvent());
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
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: BlocConsumer<ToDoBloc, ToDoState>(
        bloc: toDoBloc,
        listenWhen: (previous, current) => current is ToDoActionState,
        buildWhen: (previous, current) => current is! ToDoActionState,
        listener: (context, state) {
          switch (state.runtimeType) {
            case ToDoAddToDoButtonClicked:
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Center(
                      child: Text(
                        'Add To Do',
                        style: GoogleFonts.urbanist(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    content: TextFormField(
                      controller: _addTodo,
                      style: GoogleFonts.urbanist(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter your to-do',
                        hintStyle: GoogleFonts.urbanist(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Close the dialog box
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Close',
                          style: GoogleFonts.urbanist(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          toDoBloc.add(ToDoAddToDoSubmitButtonClickedEvent(
                              description: _addTodo.text));
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Add',
                          style: GoogleFonts.urbanist(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                      ),
                    ],
                  );
                },
              );
              break;
            default:
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ToDoLoadingState:
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            case ToDoEmptyState:
              return Center(
                child: Text(
                  "Create your first ToDo!",
                  style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
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
                    status: todoItem.completed,
                  );
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
